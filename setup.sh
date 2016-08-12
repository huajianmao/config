#!/bin/bash

git submodule init
git submodule update

for conf in `ls -d */ | cut -f1 -d'/'`; do
  cd $conf
  setupfile=./setup.sh

  if [ -f $setupfile ];
  then
    sh ./setup.sh
  else
    echo "Skip $conf"
  fi
  cd ..
done
