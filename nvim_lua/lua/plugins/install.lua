return {
--    'tpope/vim-fugitive',

--    'altercation/vim-colors-solarized',
--    'lifepillar/vim-solarized8',


    -- autocompletion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- vscode snippet format
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',

    'nvim-telescope/telescope.nvim',
    -- Include general nvim functions, for letescope
--    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',

    -- Programming language parsing system, for highlighting, still an experimental feature
--    {
--      'nvim-treesitter/nvim-treesitter',
--      build = ":TSUpdate"
--    },

--    'nvim-lualine/lualine.nvim',
--    'windwp/nvim-autopairs',

--    'Vimjas/vim-python-pep8-indent',

--    {
--      'akinsho/toggleterm.nvim',
--      version = "*",
--      config = true
--    },
    'neovim/nvim-lspconfig',

    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    'williamboman/mason-lspconfig.nvim',

    'tell-k/vim-autopep8',
}
