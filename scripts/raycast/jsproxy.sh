#!/bin/bash

# Dependency: None.

# @raycast.title jsproxy
# @raycast.author Huajian Mao
# @raycast.authorURL https://github.com/huajianmao

# @raycast.description Connect to network with jsproxy.

# @raycast.icon 📚
# @raycast.mode silent
# @raycast.packageName Internet
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "URL" }

open "https://jsproxy.huajianmao.workers.dev/-----$1"
