#!/bin/sh

sudo apt update
sudo apt upgrade

sudo apt install build-essential zsh tmux \
  fd-find ripgrep git lazygit autojump fswatch \
  curl dos2unix tree p7zip-full fzf ghostty unrar \
  gh xclip xsel \
  smplayer kanata reminna gnome-tweaks gnome-shell-extensions

# install rust-up
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
