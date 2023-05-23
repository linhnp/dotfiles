return {
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
              "bash", 
              "json",
              "lua",
              "markdown",
              "markdown_inline",
              "python",
              "query",
              "regex",
              "vim",
              "yaml",
            },
            highlight = {
                enable = true,
            }
          },
      
    }
}