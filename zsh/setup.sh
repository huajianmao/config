#!/bin/sh

RCFILE=~/.zshrc
CONFIG=`pwd`/dotzshrc

OMZRC=~/.oh-my-zsh
OHMYZSH=`pwd`/oh-my-zsh

FONTFILE=`pwd`/PowerlineSymbols.otf
FONTDIR=/usr/share/fonts/extra

if [ -f $RCFILE ];
then
  mv $RCFILE $RCFILE.`date +%Y-%m-%d_%H:%M:%S`
fi
ln -s $CONFIG $RCFILE

if [ -d $OMZRC ];
then
  mv $OMZRC $OMZRC.`date +%Y-%m-%d_%H:%M:%S`
fi
# ln -s $OHMYZSH $OMZRC

echo "To install patch font into $FONTDIR, root privilliage needed!"
sudo mkdir -p $FONTDIR
sudo cp $FONTFILE $FONTDIR
sudo fc-cache -fv

git clone https://github.com/robbyrussell/oh-my-zsh.git $OMZRC
cp hjmao.zsh-theme $OMZRC/themes/
