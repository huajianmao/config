#!/usr/bin/env bash

echo "In partial/terminal"
exit

############################
# set default preferences for Terminal
############################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# color theme to solarized dark
# set selection color
# Install terminal color theme
wget https://raw.githubusercontent.com/altercation/solarized/master/osx-terminal.app-colors-solarized/Solarized%20Dark%20ansi.terminal -O /tmp/SolarizedDark.terminal
wget https://raw.githubusercontent.com/altercation/solarized/master/osx-terminal.app-colors-solarized/Solarized%20Light%20ansi.terminal -O /tmp/SolarizedLight.terminal
open /tmp/SolarizedDark.terminal
sleep 1
open /tmp/SolarizedLight.terminal
sleep 1
# Select Terminal color theme
defaults write com.apple.terminal "Default Window Settings" -string "SolarizedDark"
defaults write com.apple.terminal "Startup Window Settings" -string "SolarizedDark"

# Terminal
# terminal close on exit
defaults write com.apple.Terminal ShellExitAction 1
defaults write com.apple.Terminal FontAntialias 1
defaults write com.apple.Terminal Shell "/bin/zsh"
