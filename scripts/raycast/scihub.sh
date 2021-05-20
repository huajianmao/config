#!/bin/bash

# Dependency: None.

# @raycast.title scihub
# @raycast.author Huajian Mao
# @raycast.authorURL https://github.com/huajianmao

# @raycast.description Find paper with DOI on scihub.

# @raycast.icon 📑
# @raycast.mode silent
# @raycast.packageName Internet
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "DOI" }

open "https://sci-hub.scihubtw.tw/$1"
