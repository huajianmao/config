#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd $BASEDIR

# 1. run git to tigger the installation of Xcode Command Line Tools
git

sh ./_pre/settings.sshkey.sh
sh ./_pre/settings.hostname.sh
sh ./_pre/apps.brew.sh
sh ./_pre/apps.appstore.sh
sh ./_pre/apps.misc.sh

# NON-Brew Apps
# Disco for burn

# 5. install Apps
# You may install shadowsocksx-ng first for the network connection

# https://github.com/senta/.dotfiles/blob/master/bootstrap.sh

# You may need to set PROXY for some package downloading
# export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
