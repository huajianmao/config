#!/bin/sh

curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | tee /etc/apt/sources.list.d/home:manuelschneid3r.list
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
apt update

apt --download-only install \
  autojump fswatch vim git tmux zsh build-essential curl dos2unix tree exuberant-ctags \
  nodejs npm exfat-fuse exfat-utils dmsetup p7zip-full \
  python3-pandas python3-matplotlib python3-sklearn python3-seaborn python3-markdown \
  python3-pycodestyle python3-pytest python3-pytest-cov \
  fcitx-module-autoeng-ng fcitx-module-punc-ng fcitx-module-fullwidthchar-enhance \
  cargo curl xdotool albert imagemagick docker.io fzf mlocate ttf-mscorefonts-installer \
  octave unrar
#autokey @github

sudo apt-get install ibus-sunpinyin smplayer
sudo apt-get install texlive-science texlive-latex-recommended texlive-publishers texlive-bibtex-extra texlive-xetex texlive-lang-cjk latexmk

# curl https://getcroc.schollz.com | bash
