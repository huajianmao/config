#!/usr/bin/env bash

echo "In _pre/apps.brew"
exit

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install Apps
BREW_APPS=(
  aria2
  dos2unix
  findutils
  imagemagick
  mas
  node
  p7zip
  tmux
  tree
  unrar
  vim
  wget
)

BREW_CASK_APPS=(
  alfred
  basictex
  cheatsheet
  dash
  dropbox
  enpass
  flux
  gimp
  github
  google-chrome
  iina
  imazing
  insomnia
  intellij-idea
  karabiner-elements
  neteasemusic
  omnifocus
  pycharm
  qlstephen
  shadowsocksx-ng
  snipaste
  teamviewer
  v2rayu
  virtualbox
  visual-studio-code
  webstorm
  wechat
  xmind
)


brew install ${BREW_APPS[@]}
brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}
rm -rf /Library/Caches/Homebrew/*
