-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

map("n", "<leader>tt", ":FloatermToggle <CR>")
-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
--
map("n", "<leader><C-w>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.wo.relativenumber = true

vim.g.nvim_tree_group_empty = 1

