#!/usr/bin/env sh

echo "_post/karabiner"
exit

mkdir -p ~/.config/karabiner
cd ~/.config/karabiner
ln -s ~/workspace/config/platforms/macosx/karabiner.json ./
