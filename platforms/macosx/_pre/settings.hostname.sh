#!/usr/bin/env bash

echo "in _pre/settings.hostnme.sh"
exit

HOSTNAME=mini

# 2. change the hostname to whatever you like
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo scutil --set ComputerName $HOSTNAME
