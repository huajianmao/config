#!/bin/bash

# Dependency: This script requires `libgen.rs` CLI which can be found https://github.com/huajianmao/libgen.rs.

# @raycast.title Libgen.rs
# @raycast.author Huajian Mao
# @raycast.authorURL https://github.com/huajianmao

# @raycast.description Get book from libgen.rs

# @raycast.icon 📚
# @raycast.mode fullOutput
# @raycast.packageName Internet
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "Seach word of the book" }
# @raycast.argument2 { "type": "text", "placeholder": "Book index", "optional": true }

if command -v libgen &> /dev/null; then
    cd ~/Desktop
    sh -c "libgen $1 $2"
else
    open "http://libgen.rs/search.php?req=$1&open=0&res=25&view=simple&phrase=1&column=def"
fi
