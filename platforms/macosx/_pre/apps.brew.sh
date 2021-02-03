#!/usr/bin/env bash

echo "In _pre/apps.brew"

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install Apps
BREW_APPS=(
  # aria2
  # asciidoctor
  autojump
  croc
  dos2unix
  findutils
  fswatch
  gh
  howdoi
  imagemagick
  mas
  # node
  octave
  p7zip
  tmux
  tree
  vim
  wget
  # yarn
)

BREW_CASK_APPS=(
  alfred
  # android-studio
  # axure-rp
  basictex
  # calibre
  # cheatsheet
  # dash
  # datagrip
  # dropbox
  enpass
  maczip
  fliqlo
  flux
  # gimp
  # github
  google-chrome
  hammerspoon
  hyperswitch
  iina
  # imazing
  # insomnia
  intellij-idea
  itsycal
  karabiner-elements
  # mindmaster
  # motrix
  neteasemusic
  notion
  # omnifocus
  # omnigraffle
  # openinterminal
  pock
  prince
  pycharm
  # qlstephen
  #sequel-ace
  # shadowsocksx-ng
  # sketch
  # snip
  # snipaste
  # spectacle
  # tableplus
  # teamviewer
  # thunder
  # v2rayu
  v2rayx
  # virtualbox
  visual-studio-code
  webstorm
  wechat
  wpsoffice
  # wkhtmltopdf
  # xmind
)


brew install ${BREW_APPS[@]}
brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}
rm -rf /Library/Caches/Homebrew/*
