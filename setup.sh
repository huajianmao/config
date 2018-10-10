#!/bin/bash

SETUP_FILE_NAME="setup.sh"
PRE_SETUP_FILE_NAME="setup.pre.sh"
POST_SETUP_FILE_NAME="setup.post.sh"

git submodule init
git submodule update

# Determine the OS type
unameout="$(uname -s)"
platform="unknown"
case "${unameout}" in
    Linux*) platform="ubuntu" ;;
    Darwin*) platform="macosx" ;;
    CYGWIN*) platform="cygwin" ;;
    MINGW*) ;;
    *) ;;
esac
if [ "${platform}" = "unknown" ]; then
    echo "Sorry, your OS is not supported yet!"
    exit -1
fi

# Pre steps for setting up, mainly for App installation
presetup="platforms/${platform}/${PRE_SETUP_FILE_NAME}"
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
    echo FIXME: sh ./${SETUP_FILE_NAME}
  else
    echo "Skip $conf"
  fi
  cd ..
done
popd

# Post steps for setting up, configuration for App preferences
postsetup="platforms/${platform}/${POST_SETUP_FILE_NAME}"
if [ -f ${postsetup} ]; then
  echo "Post-setup for ${platform}"
  sh ${postsetup}
else
  echo "No need to do post-setup for ${platform}"
fi
