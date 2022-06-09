require "custom.configs.autocmds"

vim.cmd "silent! command! EnableShade lua require('shade').toggle()"

vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3
vim.wo.colorcolumn = "80"
vim.wo.cursorline = true
vim.wo.relativenumber = true

