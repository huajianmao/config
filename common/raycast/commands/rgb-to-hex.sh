#!/bin/bash

# @raycast.title RGB to Hex
# @raycast.author Huajian Mao
# @raycast.authorURL https://github.com/huajianmao
# @raycast.description Convert RGB value to hexadecimal color value.

# @raycast.icon 🎨
# @raycast.mode silent
# @raycast.packageName Conversions
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "255,255,255" }

rgb=$1
IFS=, read -r r g b <<< "$rgb"

re='^[0-9]+$'

if [[ $r =~ $re ]] && [[ $g =~ $re ]] && [[ $b =~ $re ]] \
  && (( r >= 0)) && (( g >= 0 )) && (( b >= 0)) \
  && (( r <= 255 )) && (( g <= 255 )) && (( b <= 255 )); then
  hex=`printf '#%02x%02x%02x' $r $g $b  | awk '{ print toupper($0) }'`
  echo ${hex} | pbcopy
  echo "Converted $rgb to ${hex}"
else
  echo "Invalid rgb value: $rgb";
fi
