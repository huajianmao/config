#!/bin/sh

RCFILE=~/.zshrc
CONFIG=$(pwd)/dotzshrc

OMZRC=~/.oh-my-zsh
OHMYZSH=$(pwd)/oh-my-zsh

if [ -f $RCFILE ]; then
  mv $RCFILE $RCFILE.$(date +%Y-%m-%d_%H:%M:%S)
fi
ln -s $CONFIG $RCFILE

if [ -d $OMZRC ]; then
  mv $OMZRC $OMZRC.$(date +%Y-%m-%d_%H:%M:%S)
fi
# ln -s $OHMYZSH $OMZRC

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*)
  FONTFILE=$(pwd)/PowerlineSymbols.otf
  FONTDIR=/usr/share/fonts/extra
  echo "To install patch font into $FONTDIR, root privilliage needed!"
  ;;
Darwin*)
  echo "In Mac OS X, no need to install fonts"
  ;;
CYGWIN*) ;;
MINGW*) ;;
*) ;;
esac

git clone https://github.com/robbyrussell/oh-my-zsh.git $OMZRC
git clone https://github.com/zsh-users/zsh-autosuggestions $OMZRC/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OMZRC/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $OMZRC/custom/plugins/zsh-completions

ln -s $(pwd)/hjmao.zsh-theme $OMZRC/themes/
