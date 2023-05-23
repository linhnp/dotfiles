local fb_actions = require "telescope._extensions.file_browser.actions"

require('telescope').setup{
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        initial_mode = "normal",
        mappings = {
            i = {
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                ['<C-j>'] = require('telescope.actions').move_selection_next,
                ['<C-k>'] = require('telescope.actions').move_selection_previous,
            }
        },
        preview = {
            hide_on_startup = false -- hide previewer when picker starts
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
    },
    pickers = {
        find_files = {
            initial_mode = 'normal'
        },
        treesitter = {
            symbols = {'function'}
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')

M = require 'common'
M.nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
M.nmap('<leader>gs', '<cmd>Telescope grep_string<cr>')
M.nmap('<leader>t', '<cmd>Telescope file_browser<cr>')
