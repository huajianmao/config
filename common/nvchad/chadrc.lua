-- Just an example, supposed to be placed in /lua/custom/


local M = {}

local userPlugins = require "custom.plugins"

M.plugins = {
  install = userPlugins,
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    }
  }
}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "monokai",
}

return M
