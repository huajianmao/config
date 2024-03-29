local M = {}

--
M.disabled = {
--    "<C-n>",
}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
   },
}

M.treesitter = {
   n = {
      ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
   },
}

M.floatterm = {
  n = {
    ["<leader>tt"] = {"<cmd> FloatermToggle <CR>", "   toggle float term"},
  }
}

M.shade = {
   n = {
      ["<leader>s"] = {
         function()
            require("shade").toggle()
         end,

         "   toggle shade.nvim",
      },
   },
}

M.misc = {
  n = {
    ["<leader><C-w>"] = {"<cmd> bp<bar>sp<bar>bn<bar>bd<CR>", "   close buffer"}
  }
}

return M
