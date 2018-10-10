#!/usr/bin/env bash

echo "In _pre/apps.brew"
exit

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install Apps
BREW_APPS=(
  dos2unix
  findutils
  imagemagick
  mas
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
  dropbox
  enpass
  github
  google-chrome
  iina
  imazing
  insomnia
  intellij-idea
  karabiner
  neteasemusic
  omnifocus
  pycharm
  shadowsocksx-ng
  teamviewer
  virtualbox
  visual-studio-code
  webstorm
  wechat
  xmind
)


brew install ${BREW_APPS[@]}
brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}
rm -rf /Library/Caches/Homebrew/*
