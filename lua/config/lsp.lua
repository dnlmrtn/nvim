-- lsp.lua

-- Ensure the language server is installed
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "pyright" }
})

-- LSP configuration
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {}
lspconfig.pyright.setup {}

