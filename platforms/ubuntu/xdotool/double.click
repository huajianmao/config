#!/bin/bash

eval $(xdotool getmouselocation --shell)

xdotool mousemove $(cat ~/.config/xdotool/wechat.pos) click 1
xdotool click 1

xdotool mousemove $X $Y
