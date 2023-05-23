require('config.settings') -- need to be import first for mapleader to work
require('config.autocmds')
require('config.mappings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = {
--   'tpope/vim-fugitive',

--   'altercation/vim-colors-solarized',
--   'lifepillar/vim-solarized8',

--   'neovim/nvim-lspconfig',

--   -- autocompletion
--   'hrsh7th/cmp-nvim-lsp',
--   'hrsh7th/cmp-buffer',
--   'hrsh7th/cmp-path',
--   'hrsh7th/cmp-cmdline',
--   'hrsh7th/nvim-cmp',
--   -- vscode snippet format
--   'hrsh7th/cmp-vsnip',
--   'hrsh7th/vim-vsnip',

--   'nvim-telescope/telescope.nvim',
--   -- Include general nvim functions, for letescope
--   'nvim-lua/plenary.nvim',
--   'nvim-telescope/telescope-fzy-native.nvim',
--   'nvim-telescope/telescope-file-browser.nvim',

--   -- Programming language parsing system, for highlighting, still an experimental feature
--   {
--     'nvim-treesitter/nvim-treesitter',
--     build = ":TSUpdate"
--   },

--   'nvim-lualine/lualine.nvim',
--   'windwp/nvim-autopairs',

--   'Vimjas/vim-python-pep8-indent',

--   {
--     'akinsho/toggleterm.nvim',
--     version = "*",
--     config = true
--   },
--   {
--     "williamboman/mason.nvim",
--     build = ":MasonUpdate" -- :MasonUpdate updates registry contents
--   },
--   'williamboman/mason-lspconfig.nvim'
-- }

require("lazy").setup('plugins')
require('plugins_config')