#!/bin/sh

CONFIG=`pwd`/dottmux.conf
DOTTMUX=`pwd`/dottmux
RCFILE=~/.tmux.conf

if [ -f $RCFILE ];
then
  mv $RCFILE $RCFILE.`date +%Y-%m-%d_%H:%M:%S`
fi
ln -s $CONFIG $RCFILE

mkdir -p ~/.tmux/
ln -s $DOTTMUX/* ~/.tmux/
