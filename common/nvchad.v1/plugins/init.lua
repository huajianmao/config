return {
  ['williamboman/nvim-lsp-installer'] = {
    config = function()
      require("custom.plugins.configs.lspinstaller").setup()
    end
  },

  ["voldikss/vim-floaterm"] = {
    config = function()
      require("custom.plugins.configs.floatterm").setup()
    end
  },

  ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
        local present, autotag = pcall(require, "nvim-ts-autotag")

        if present then
          autotag.setup()
        end
      end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.configs.null-ls"
      end,
  },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
       "TZAtaraxis",
       "TZMinimalist",
       "TZFocus",
    },
    config = function()
       require "custom.plugins.configs.truezen"
    end,
  },

  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.configs.neorg"
    end,
  },

  ["nvim-treesitter/playground"] = {
      cmd = "TSCaptureUnderCursor",
      config = function()
        require("nvim-treesitter.configs").setup()
      end,
  },
}
