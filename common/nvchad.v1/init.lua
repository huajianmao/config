require "custom.configs.autocmds"

vim.cmd "silent! command! EnableShade lua require('shade').toggle()"

vim.wo.relativenumber = true
