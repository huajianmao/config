#!/bin/sh
# docker-compose up -d
docker run -d \
  --name yapi \
  --link yapidb:mongo \
  --workdir /api/vendors \
  -p 3000:3000 \
  registry.cn-hangzhou.aliyuncs.com/anoy/yapi \
  server/app.js

