#!/usr/bin/env bash

echo "In _pre/apps.appstore"
exit

# FIXME: check if mas is installed and signed in

####################################
# 6. install Apps from Mac App Store
####################################
# You will need to login first:
# mas signin apple.id@gmail.com "password"
mas install 497799835 # Xcode
mas install 1176895641 # Spark
