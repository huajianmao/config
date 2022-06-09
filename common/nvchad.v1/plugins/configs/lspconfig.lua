local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = { "html", "cssls", "jsonls", "rust_analyzer", "tsserver" }

  for _, lsp in ipairs(servers) do
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {},
    }

    lspconfig[lsp].setup(opts)
    -- vim.cmd [[ do User LspAttachBuffers]]
  end
end
return M
