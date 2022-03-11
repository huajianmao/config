local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require 'lspconfig'

  local servers = { "html", "cssls", "tsserver", "rust_analyzer", "jsonls", "java_language_server"}

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

return M

