-- treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {'python', 'lua', 'markdown', 'json'},
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
    }
  }