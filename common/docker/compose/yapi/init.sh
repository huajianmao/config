#!/bin/zsh
mkdir -p ../../volumes/yapi/db
mkdir -p ../../volumes/yapi/data

docker run -d --name yapidb --volume `pwd`/../../volumes/yapi/db:/data/db mongo

docker run -it --rm \
  --link yapidb:mongo \
  --entrypoint npm \
  --workdir /api/vendors \
  registry.cn-hangzhou.aliyuncs.com/anoy/yapi \
  run install-server

