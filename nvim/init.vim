set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set ff=unix
let $TAR_DIR = $HOME
let $VHOME = $HOME."/.config/nvim"
let $VWHOME = $TAR_DIR."/workspace/vimwiki"
let $JOBHOME = $TAR_DIR."/workspace/jobs"
set runtimepath+=$VHOME."/bundle/vim-plug"
let mapleader = ","    " rebind <Leader> key
let g:loaded_python_provider=0
let g:loaded_perl_provider = 0
let g:python_host_skip_check=1

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin($VHOME.'/bundle')

" this mostly for the status line
Plug 'tpope/vim-fugitive'

" fuzzy file finder, need it for ctrlp-funky
" Plug 'ctrlpvim/ctrlp.vim'
" function navigator
" Plug 'tacahiroy/ctrlp-funky'

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

Plug 'neovim/nvim-lspconfig'

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" vscode snippet format
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-telescope/telescope.nvim'
" Include general nvim functions, for letescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Programming language parsing system, for highlighting, still an experimental feature
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'

" Plug 'LunarWatcher/auto-pairs'
Plug 'windwp/nvim-autopairs'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'dstein64/vim-startuptime'

" Initialize plugin system
call plug#end()

" Plug said it already runs these command
" filetype plugin indent on
" syntax enable

" Option
set t_Co=256 					" set to use 256 color
set tabstop=4					" set tab width
set softtabstop=4
set expandtab
set shiftwidth=4
set nobackup					" set no backup file
set nowritebackup
set noswapfile					" set no swap file
set pastetoggle=<F2>			" text will not be automatically indented when pasting
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set rnu nu 						" display line number
" nnoremap <F6> :set nornu!<CR>	" mapping F6 to nonumber
" set autochdir 					" auto set current file's folder current folder
set guitablabel=%t				" set vim tab only display file name
noremap <Leader>Q :ccl<CR>		" CLose quickfix
set autoindent nosmartindent
set wildignore=*.pyc

"set foldmethod=indent
"set foldlevel=1
"set foldclose=all

set clipboard+=unnamedplus

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=r
endif

" mapping
inoremap jj <Esc>					" map jj to <ESC>
noremap <C-n> :nohl<CR>			" Remove hightlight of last search
noremap <Leader>s :update<CR>	" Quick save command
noremap <Leader>q :quit<CR>		" Quick quit command
vnoremap < <gv					" moving code block
vnoremap > >gv					" moving code block
map Q gq						" Don't use Ex mode, use Q for formatting
inoremap <C-U> <C-G>u<C-U>		" Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <c-f> y<ESC>/<c-r>"<CR>
set splitbelow
set splitright

let g:vim_json_warnings = 0

" For all text files set 'textwidth' to 78 characters.
" set textwidth=80
" paragraph is dynamically resized when a change is made to its lines set
" formatoptions+=a

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside anevent handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" au FileType python setlocal formatprg=autopep8\ -
" template
au BufNewFile * :silent! exec ":0r ".$VHOME."/templates/".&ft
" Vim diff
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

au FileType yaml set cursorcolumn

" do not show preview, when popup close, close all preview
" set completeopt-=preview
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" use solarized scheme
set background=light
if exists('$TMUX')
    colorscheme solarized
else
    set termguicolors " this variable must be enabled for colors to be applied properly
    autocmd vimenter * ++nested colorscheme solarized8
endif

" highhight trailing spaces
" need to be placed after selecting scheme
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" ctrlp.vim
" let g:ctrlp_map = '<c-p>'					" quick open ctrlp
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_max_history = 0

"if has("unix")
"    let s:uname = system("uname")
"    if s:uname == "Darwin\n"
"        " Do Mac stuff here
"        let g:python3_host_prog = '/usr/local/bin/python3'
"        let g:python_host_prog = '/usr/local/bin/python3'
"    endif
"endif

" nnoremap <Leader>fu :CtrlPFunky<Cr>
" " narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" let g:ctrlp_funky_syntax_highlight = 1

if filereadable(expand('~/.abbrev.vim'))
    so ~/.abbrev.vim
endif

lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}

require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            mirror = false,
            preview_cutoff = 0,
          },
          vertical = {
            mirror = false,
          },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
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
        }
    },
    pickers = {
        treesitter = {
            symbols = {'function'}
        }
    }
}
require('telescope').load_extension('fzy_native')

vim.o.completeopt = "menu,menuone,noselect"

-- auto-pairs
require("nvim-autopairs").setup {
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --['<Tab>'] = cmp.mapping(function(fallback)
    --  local col = vim.fn.col('.') - 1

    --  if cmp.visible() then
    --    cmp.select_next_item(select_opts)
    --  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --    fallback()
    --  else
    --    cmp.complete()
    --  end
    --end, {'i', 's'}),
    ---- end <Tab>

    --['<S-Tab>'] = cmp.mapping(function(fallback)
    --  if cmp.visible() then
    --    cmp.select_prev_item(select_opts)
    --  else
    --    fallback()
    --  end
    --end, {'i', 's'}),
    -- end <S-Tab>
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users
      { name = 'buffer' },
      { name = 'path' }
  })
})
-- end cmd general setup

-- auto-pairs for cmp
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox_light',
    component_separators = {'|', '|'},
    section_separators = '',
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

--require'nvim-tree'.setup {
--  git = {
--    enable = true,
--    ignore = true
--  },
--  filters = {
--    custom = {'__pycache__', 'env', '.git', 'node_modules', '.cache'}
--  },
--  renderer = {
--    root_folder_modifier = ":~",
--    indent_markers = {
--      enable = false,
--      icons = {
--        corner = "└ ",
--        edge = "│ ",
--        item = "│ ",
--        none = "  ",
--      },
--    },
--    icons = {
--      webdev_colors = true,
--      git_placement = "before",
--      padding = " ",
--      symlink_arrow = " ➛ ",
--      show = {
--        file = true,
--        folder = true,
--        folder_arrow = true,
--        git = true,
--      },
--      glyphs = {
--        default = "",
--        symlink = "",
--        folder = {
--          arrow_closed = "",
--          arrow_open = "",
--          default = "▸",
--          open = "▾",
--          empty = "",
--          empty_open = "",
--          symlink = "",
--          symlink_open = "",
--        },
--        git = {
--          unstaged = "✗",
--          staged = "✓",
--          unmerged = "",
--          renamed = "➜",
--          untracked = "★",
--          deleted = "",
--          ignored = "◌",
--        }
--      }
--    }
--  }
--}
--
---- vim-tree auto close
--vim.api.nvim_create_autocmd("BufEnter", {
--  nested = true,
--  callback = function()
--    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--      vim.cmd "quit"
--    end
--  end
--})

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python"},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  }
}

-- toggleterm terminal
require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    direction = 'float',
    close_on_exit = true,
    insert_mappings = true,
    terminal_mappings = true,
}


EOF

" vsnip
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>

" nvim-tree
" nnoremap <leader>t :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" auto-pairs
" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert = '<leader>b'

