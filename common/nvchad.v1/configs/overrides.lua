-- overriding default plugin configs!

local M = {}

M.treesitter = {
   ensure_installed = {
      "bash",
      "c",
      "css",
      "html",
      "java",
      "javascript",
      "json",
      "latex",
      "lua",
      "markdown",
      "make",
      "python",
      "toml",
      "typescript",
      "vim",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      group_empty = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

M.blankline = {
   filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "norg",
      "",
   },
}

return M
