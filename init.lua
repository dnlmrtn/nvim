-- Load plugins
require('plugins.plugins')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.gitsigns')

-- Load config files
require('config.lsp')
require('config.keymaps')
require('config.options')

-- Apply Kanagawa color scheme
vim.cmd("colorscheme kanagawa-dragon")

