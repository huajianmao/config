local M = {}

M.misc = {
  n = {
    ["<leader>tt"] = {"<cmd> FloatermToggle <CR>", "Toggle floatterm"},
    ["<leader><C-w>"] = {"<cmd> bp<bar>sp<bar>bn<bar>bd <CR>"}
  }
}

return M
