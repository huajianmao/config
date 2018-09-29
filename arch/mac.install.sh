#!/usr/bin/env bash

# NON-Brew Apps
# Disco for burn

BREW_APPS=(
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
  pycharm-pro
  shadowsocksx-ng
  virtualbox
  visual-studio-code
  webstorm
  wechat
  xmind
)

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ${BREW_APPS[@]}

brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}
brew cask alfred link

brew cleanup --force
rm -rf /Library/Caches/Homebrew/*



# FIXME:

# export OPT_DIR=/opt

# Etcher F.lux Franz Gimp SciHub
# Transmission Xcode YoudaoNote
# Soda Player

# jdk scala gradle sbt

# nodejs
# NODEJS_VERSION=v10.11.0
# NODEJS_PKG_NAME=node-${NODEJS_VERSION}-darwin-x64.tar.gz
# wget https://nodejs.org/dist/${NODEJS_VERSION}/${NODEJS_PKG_NAME} -o ~/Downloads/${NODEJS_PKG_NAME}
# sudo tar zxvf ${NODEJS_PKG_NAME} -C ${OPT_DIR}/node/${NODEJS_VERSION}


