#!/bin/sh

DOTFZF=~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $DOTFZF
$DOTFZF/install

