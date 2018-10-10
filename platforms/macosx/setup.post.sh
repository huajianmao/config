#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd $BASEDIR

############################
# 6. set default preferences
############################
sh ./_post/defaults.sh
sh ./_post/terminal.sh
sh ./_post/misc.sh