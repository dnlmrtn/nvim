-- plugins.lua

-- Automatically install packer if not already installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- Kanagawa color scheme
  use "rebelot/kanagawa.nvim"

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
-- LSP configuration and Mason for managing LSP servers
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("lspconfig").tsserver.setup{}
    end
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require'nvim-tree'.setup {}
    end
  }

  -- Telescope for fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)

