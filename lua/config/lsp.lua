-- Setup mason to manage LSP

-- Ensure the language server is installed
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "pyright" }
})

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP configuration
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
	capabilities = capabilities
}
lspconfig.pyright.setup {
	capabilities = capabilities
}

