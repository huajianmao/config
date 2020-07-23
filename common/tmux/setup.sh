#!/bin/sh

CONFIG=`pwd`/dottmux.conf
DOTTMUX=`pwd`/dottmux
RCFILE=~/.tmux.conf

ln -s $DOTTMUX/* ~/.tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -f $RCFILE ];
then
  mv $RCFILE $RCFILE.`date +%Y-%m-%d_%H:%M:%S`
fi
ln -s $CONFIG $RCFILE
