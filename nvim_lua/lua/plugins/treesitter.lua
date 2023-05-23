return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {'python', 'lua', 'markdown', 'json'},
        sync_install = false,
        auto_install = false,
        highlight = {
            enable = true,
        },
        indent = { enable = true },
    }
}
