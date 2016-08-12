#!/bin/sh

CONFIG=`pwd`/dotvimrc
RCFILE=~/.vimrc

if [ -f $RCFILE ];
then
  mv $RCFILE $RCFILE.`date +%Y-%m-%d_%H:%M:%S`
fi
ln -s $CONFIG $RCFILE

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Done config vim, but you need to install the bundles in vim!"
echo "We need to install instant-markdown-d with node.js. Please refer to [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)"
