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
  gitfs
  howdoi
  imagemagick
  mas
  # node
  octave
  p7zip
  # sshfs
  tmux
  tree
  vim
  wget
  # yarn
)

BREW_CASK_APPS=(
  # alfred
  alacritty
  android-platform-tools
  # android-studio
  # axure-rp
  basictex
  # calibre
  # cheatsheet
  # dash
  # datagrip
  # dropbox
  edex-ui
  enpass
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
  inkscape
  intellij-idea
  itsycal
  karabiner-elements
  listen1
  maczip
  # mindmaster
  # motrix
  neteasemusic
  netnewswire
  nextcloud
  notion
  obsidian
  # omnifocus
  # omnigraffle
  # openinterminal
  osxfuse
  pock
  prince
  pycharm
  # qlstephen
  # rectangle
  raycast
  # sequel-ace
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


brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

brew install ${BREW_APPS[@]}
brew cask install --appdir="/Applications" ${BREW_CASK_APPS[@]}
rm -rf /Library/Caches/Homebrew/*
