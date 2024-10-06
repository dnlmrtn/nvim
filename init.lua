-- Load plugins
require('plugins.gitsigns')
require('plugins.nvim-cmp')
require('plugins.nvim-tree')
require('plugins.telescope')

-- Load config files
require('config.lsp')
require('config.keymaps')
require('config.options')

-- Apply Kanagawa color scheme
vim.cmd("colorscheme kanagawa-dragon")

