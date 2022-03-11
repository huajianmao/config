return {
  {
    'williamboman/nvim-lsp-installer',
    config = function()
      require("custom.plugins.lsp-installer").setup()
    end
  },
  { 'voldikss/vim-floaterm' },
  {
    'jose-elias-alvarez/null-ls.nvim',
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },
  {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
                  find_cmd = "rg", -- find command (defaults to `fd`)
               },
            },
         }
         require("telescope").load_extension "media_files"
      end,
   }
}
