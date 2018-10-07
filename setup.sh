#!/bin/bash

git submodule init
git submodule update


unameout="$(uname -s)"

platform="unknown"
case "${unameout}" in
    Linux*)
	    platform="ubuntu"
	    ;;
    Darwin*)
	    platform="macosx"
	    ;;
    CYGWIN*)
	    platform="cygwin"
	    ;;
    MINGW*)
	    ;;
    *)
	    ;;
esac
if [ "${platform}" = "unknown" ]; then
    echo "Sorry, your OS is not supported yet!"
    exit -1
fi

presetup="platforms/${platform}/setup.pre.sh"
if [ -f ${presetup} ]; then
  echo "Pre-setup for ${platform}"
  sh ${presetup}
else
  echo "No need to do pre-setup for ${platform}"
fi

pushd .
cd common
for conf in `ls -d */ | cut -f1 -d'/'`; do
  cd $conf
  setupfile=./setup.sh

  if [ -f $setupfile ];
  then
    echo sh ./setup.sh
  else
    echo "Skip $conf"
  fi
  cd ..
done
popd

postsetup="platforms/${platform}/setup.post.sh"
if [ -f ${postsetup} ]; then
  echo "Post-setup for ${platform}"
  sh ${postsetup}
else
  echo "No need to do post-setup for ${platform}"
fi
