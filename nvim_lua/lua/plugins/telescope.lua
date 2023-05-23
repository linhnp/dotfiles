return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {
                'nvim-telescope/telescope-fzy-native.nvim',
                config = function ()
                    require("telescope").load_extension("fzy_native")
                end
            },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                config = function ()
                    require('telescope').load_extension('file_browser')
                end,
            }
        },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>' },
            { '<leader>gs', '<cmd>Telescope grep_string<cr>' },
            { '<leader>t', '<cmd>Telescope file_browser<cr>' },
        },
        opts = {
            defaults = {
                initial_mode = 'normal',
                prompt_prefix = "> ",
                selection_caret = "> ",
                mappings = {
                    i = {
                        ['<C-p>'] =  function()
                            return require('telescope.actions.layout').toggle_preview()
                        end,
                        ['<C-j>'] = function()
                            return require('telescope.actions').move_selection_next()
                        end,
                        ['<C-k>'] = function()
                            require('telescope.actions').move_selection_previous()
                        end,
                    }
                },
                preview = {
                    hide_on_startup = false -- hide previewer when picker starts
                }
            },
            pickers = {
                find_files = {
                    initial_mode = 'normal'
                },
                treesitter = {
                    symbols = {'function'}
                }
            },
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                },
                file_browser = {
                    dir_icon = ">",
                    cwd_to_path = false,
                    git_status = true,
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                      ["i"] = {
                      },
                      ["n"] = {
                      },
                    },
                }
            }
        }
    },
}
