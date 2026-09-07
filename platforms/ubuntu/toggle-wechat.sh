#!/bin/bash

export DISPLAY="${DISPLAY:-:0}"

find_wechat_window() {
    local wid
    wid=$(xdotool search --onlyvisible --class "[Ww]e[Cc]hat" 2>/dev/null | head -1)
    if [ -z "$wid" ]; then
        wid=$(xdotool search --onlyvisible --name "微信" 2>/dev/null | head -1)
    fi
    if [ -z "$wid" ]; then
        wid=$(xdotool search --onlyvisible --name "WeChat" 2>/dev/null | head -1)
    fi
    echo "$wid"
}

find_wechat_any() {
    local wid
    wid=$(xdotool search --class "[Ww]e[Cc]hat" 2>/dev/null | head -1)
    if [ -z "$wid" ]; then
        wid=$(xdotool search --name "微信" 2>/dev/null | head -1)
    fi
    if [ -z "$wid" ]; then
        wid=$(xdotool search --name "WeChat" 2>/dev/null | head -1)
    fi
    echo "$wid"
}

wid=$(find_wechat_window)

if [ -z "$wid" ]; then
    wid=$(find_wechat_any)
    if [ -n "$wid" ]; then
        xdotool windowactivate "$wid" 2>/dev/null
        exit 0
    fi
    nohup /usr/bin/wechat >/dev/null 2>&1 &
    exit 0
fi

active_wid=$(xdotool getactivewindow 2>/dev/null)

if [ "$wid" = "$active_wid" ]; then
    xdotool windowminimize "$wid" 2>/dev/null
else
    xdotool windowactivate "$wid" 2>/dev/null
fi
