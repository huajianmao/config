#!/bin/sh

USER=USER
HOST=HOST
SSH_PORT=SSH_PORT
PROXY_PORT=PROXY_PORT
ssh $USER@$HOST -p $SSH_PORT "docker stop nginx; docker start tinyproxy"
networksetup -setwebproxy wi-fi $HOST $PROXY_PORT off
