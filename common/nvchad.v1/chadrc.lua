local M = {}

local overrides = require "custom.overrides"

M.plugins = {
  options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.configs.lspconfig",
      },

      statusline = {
        separator_style = "round",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
      ["lukas-reineke/indent-blankline.nvim"] = overrides.blankline,
   },

   user = require "custom.plugins",

   -- remove = {
   --    "folke/which-key.nvim",
   -- },
}

M.ui = {
   theme = "onedark",
}

M.mappings = require "custom.mappings"

return M
