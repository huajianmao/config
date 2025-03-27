#!/usr/bin/env bash

# Script to map a remote port to a local port using socat, managed by name.
# Usage:
#   nat start <name> <local_port> <remote_ip:remote_port>
#   nat stop <name>

# --- Configuration ---
# Directory to store PID files for named mappings
PID_DIR="${HOME}/.local/share/nat"
# Default behavior: Listen on localhost only for the local port
LISTEN_ADDR="0.0.0.0"
# Use LISTEN_ADDR="0.0.0.0" to listen on all interfaces (less secure)

# --- Functions ---
usage() {
  echo "Usage:"
  echo "  nat start <name> <local_port> <remote_ip:remote_port>"
  echo "    Example: nat start webserver 3214 10.10.10.32:8000"
  echo
  echo "  nat stop <name>"
  echo "    Example: nat stop webserver"
  echo
  echo "Arguments:"
  echo "  start        Start a new port mapping."
  echo "  stop         Stop an existing port mapping."
  echo "  <name>       A unique name for the mapping (used for starting and stopping)."
  echo "  <local_port> The local port to bind to (e.g., 3214)."
  echo "  <remote_ip:remote_port>"
  echo "               The target remote address (e.g., 10.10.10.32:8000)."
  exit 1
}

# Function to check if a process with a given PID is running
is_running() {
  local pid="$1"
  if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
    return 0 # Process exists
  else
    return 1 # Process does not exist or PID is empty
  fi
}

# --- Initial Setup ---
# Ensure PID directory exists
mkdir -p "$PID_DIR" || {
  echo "Error: Could not create PID directory: $PID_DIR"
  exit 1
}

# Check if socat is installed (do this early)
if ! command -v socat &>/dev/null; then
  echo "Error: 'socat' command not found. Please install socat."
  echo "  Debian/Ubuntu: sudo apt install socat"
  echo "  Fedora/CentOS: sudo yum install socat / sudo dnf install socat"
  echo "  macOS (brew): brew install socat"
  exit 1
fi

# --- Argument Parsing and Validation ---
ACTION="$1"
shift || usage # Need at least an action

MAP_NAME=""
LOCAL_PORT=""
REMOTE_ADDR=""
PID_FILE="" # Define PID_FILE later based on MAP_NAME

case "$ACTION" in
start)
  if [[ $# -ne 3 ]]; then
    echo "Error: Incorrect number of arguments for 'start'."
    usage
  fi
  MAP_NAME="$1"
  LOCAL_PORT="$2"
  REMOTE_ADDR="$3"

  # --- Validation for 'start' ---
  # Basic validation of REMOTE_ADDR format (contains ':')
  if [[ ! "$REMOTE_ADDR" =~ .*:.* ]]; then
    echo "Error: Invalid remote address format. Expected IP:PORT (e.g., 10.10.10.32:8000)"
    exit 1
  fi
  # Basic validation of LOCAL_PORT (is number)
  if ! [[ "$LOCAL_PORT" =~ ^[0-9]+$ ]]; then
    echo "Error: Local port must be a number."
    exit 1
  fi
  # Validate name format (simple alphanumeric + underscore/hyphen)
  if ! [[ "$MAP_NAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Mapping name contains invalid characters. Use alphanumeric, underscore, or hyphen."
    exit 1
  fi
  PID_FILE="${PID_DIR}/${MAP_NAME}.pid"
  ;;

stop)
  if [[ $# -ne 1 ]]; then
    echo "Error: Incorrect number of arguments for 'stop'."
    usage
  fi
  MAP_NAME="$1"
  # Validate name format
  if ! [[ "$MAP_NAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Mapping name contains invalid characters. Use alphanumeric, underscore, or hyphen."
    exit 1
  fi
  PID_FILE="${PID_DIR}/${MAP_NAME}.pid"
  ;;

help | -h | --help)
  usage
  ;;

*)
  echo "Error: Unknown action '$ACTION'."
  usage
  ;;
esac

# --- Execute Action ---

if [[ "$ACTION" == "start" ]]; then
  # Check if PID file exists and process is running
  if [[ -f "$PID_FILE" ]]; then
    EXISTING_PID=$(cat "$PID_FILE")
    if is_running "$EXISTING_PID"; then
      echo "Error: A mapping named '$MAP_NAME' appears to be running with PID $EXISTING_PID."
      echo "Stop it first with: $0 stop $MAP_NAME"
      exit 1
    else
      echo "Warning: Found stale PID file for '$MAP_NAME'. Removing it."
      rm -f "$PID_FILE"
    fi
  fi

  # Check if local port is likely in use (basic check)
  # Uses ss which is generally available; netstat could be an alternative
  if ss -Htan | awk '{print $4}' | grep -qE "(${LISTEN_ADDR}|0.0.0.0|\[::\]):${LOCAL_PORT}$"; then
    echo "Warning: Local port ${LOCAL_PORT} might already be in use on ${LISTEN_ADDR} or 0.0.0.0."
    # Consider adding a --force flag or exiting here if preferred
  fi

  echo "Starting mapping '$MAP_NAME': ${LISTEN_ADDR}:${LOCAL_PORT} -> ${REMOTE_ADDR}"
  echo "Access via: http://${LISTEN_ADDR}:${LOCAL_PORT}" # Adjust protocol if not HTTP

  # Run socat in the background
  socat TCP-LISTEN:"${LOCAL_PORT}",bind="${LISTEN_ADDR}",fork,reuseaddr TCP:"${REMOTE_ADDR}" &
  SOCAT_PID=$!

  # Check if socat started successfully (this checks the command launch)
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to launch socat command."
    exit 1
  fi

  # Give socat a moment to potentially fail binding the port
  sleep 0.5
  if ! is_running $SOCAT_PID; then
    echo "Error: socat process ($SOCAT_PID) terminated unexpectedly."
    echo "Check if port ${LOCAL_PORT} is available or if remote address ${REMOTE_ADDR} is correct."
    rm -f "$PID_FILE" 2>/dev/null # Clean up potential PID file if created briefly
    exit 1
  fi

  # Write PID to file
  echo "$SOCAT_PID" >"$PID_FILE"
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to write PID file: $PID_FILE"
    echo "Attempting to kill orphan socat process $SOCAT_PID..."
    kill "$SOCAT_PID" 2>/dev/null
    exit 1
  fi

  echo "Mapping '$MAP_NAME' started successfully. PID: $SOCAT_PID"
  echo "To stop: $0 stop $MAP_NAME"

elif [[ "$ACTION" == "stop" ]]; then
  echo "Attempting to stop mapping '$MAP_NAME'..."
  if [[ ! -f "$PID_FILE" ]]; then
    echo "Error: No PID file found for mapping '$MAP_NAME' at $PID_FILE."
    echo "Was it started with this name? Use: $0 start $MAP_NAME <local_port> <remote_addr>"
    exit 1
  fi

  PID_TO_KILL=$(cat "$PID_FILE")

  if [[ -z "$PID_TO_KILL" ]]; then
    echo "Error: PID file $PID_FILE is empty."
    rm -f "$PID_FILE" # Clean up empty file
    exit 1
  fi

  if is_running "$PID_TO_KILL"; then
    echo "Found running process with PID $PID_TO_KILL. Sending TERM signal..."
    if kill "$PID_TO_KILL"; then
      # Wait a moment for graceful shutdown
      sleep 0.5 # Reduced wait time
      if is_running "$PID_TO_KILL"; then
        echo "Process $PID_TO_KILL still running. Sending KILL signal..."
        if kill -9 "$PID_TO_KILL"; then
          echo "Process $PID_TO_KILL killed forcefully."
        else
          echo "Error: Failed to send KILL signal to $PID_TO_KILL."
          exit 1 # Don't remove PID file if killing failed
        fi
      else
        echo "Process $PID_TO_KILL stopped gracefully."
      fi
    else
      echo "Error: Failed to send TERM signal to PID $PID_TO_KILL. Maybe permission error?"
      exit 1 # Don't remove PID file if signaling failed
    fi
  else
    echo "Process with PID $PID_TO_KILL (from $PID_FILE) was not found running."
    echo "Perhaps it was already stopped or crashed."
  fi

  # Clean up PID file if process is confirmed gone or wasn't running
  echo "Removing PID file: $PID_FILE"
  rm -f "$PID_FILE"
  echo "Mapping '$MAP_NAME' stopped."

fi

exit 0
