#!/usr/bin/env bash

HOSTNAME=mini

# 1. run git to tigger the installation of Xcode Command Line Tools
git

# 2. change the hostname to whatever you like
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
# Change the Mac's computer name
# in System Preference -> Sharing

# 3. generate the ssh key
ssh-keygen -t rsa

# NON-Brew Apps
# Disco for burn


# 4. install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# 5. install Apps
# You may install shadowsocksx-ng first for the network connection

# https://github.com/senta/.dotfiles/blob/master/bootstrap.sh

# You may need to set PROXY for some package downloading
# export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;

BREW_APPS=(
  dos2unix
  mas
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
  virtualbox
  visual-studio-code
  webstorm
  wechat
  xmind
)


brew install ${BREW_APPS[@]}

brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}

rm -rf /Library/Caches/Homebrew/*


############################
# 6. set default preferences
############################
# You may refer to https://gist.github.com/tpinto/2420293
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false
# proxy
# power save time
# keyboard command / option switch

# Terminal
# terminal close on exit
# color theme to solarized dark

# set default shell to zsh


####################################
# 7. install Apps from Mac App Store
####################################
# You will need to login first:
# mas signin apple.id@gmail.com "password"
mas install 497799835 # Xcode

#############################
# 8. Add Apps to Startup list
#############################
# shadowsocksx-ng
# Alfred




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




