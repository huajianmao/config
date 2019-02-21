#!/usr/bin/env bash

echo "In partial/loginitems"
exit

SHADOWSOCKSX_NG_PATH=/Applications/ShadowsocksX-NG.App
osascript -e 'tell application "System Events" to make login item at end with properties {path:"'${SHADOWSOCKSX_NG_PATH}'", hidden:false}'

