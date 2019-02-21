#!/usr/bin/env bash

echo "In partial/defaults"
exit

############################
# 6. set default preferences
############################
# You may refer to https://gist.github.com/tpinto/2420293
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

chsh -s /bin/zsh
