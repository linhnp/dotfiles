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

"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vimwiki/vimwiki'
Plug 'altercation/vim-colors-solarized'
Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lifepillar/vim-solarized8'
Plug 'linhnp/lualine.nvim'
"Plug 'ray-x/lsp_signature.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'tweekmonster/startuptime.vim'

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

set foldmethod=indent
set foldlevel=1
"set foldclose=all

" set clipboard=unnamedplus		" mapping register to clipboard
" set clipboard=unnamed

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
" Don't do it when the position is invalid or when inside an event handler
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

" Nerdtree
" let g:netrw_list_hide= '.*\.pyc$'
" map <Leader>t :NERDTreeToggle<CR>			" Map to ,t
" let NERDTreeShowHidden=1					" Set show hidden file
" let NERDTreeShowBookmarks=1					" Enable nerdtree bookmarks
" " close vim when NerdTree is the only window left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp.vim
" let g:ctrlp_map = '<c-p>'					" quick open ctrlp
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_history = 0

" The Silver Searcher
if executable('ag')
    " use Ag with [ack.vim]
    let g:ackprg = 'ag --vimgrep --smart-case'
    cnoreabbrev Ack Ack!
    nnoremap <Leader>a :Ack!<Space>

    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" set vim-airline not to use powerline font
" let g:airline_powerline_fonts = 0
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_theme='bubblegum'
" " remove airline symbols
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.readonly = '[RO]'
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.maxlinenr = ''
" 
" "let g:solarized_termcolors=256
" let g:airline_mode_map = {
"     \ '__' : '──────',
"     \ 'n'  : 'N',
"     \ 'i'  : 'I',
"     \ 'R'  : 'RPlace',
"     \ 'v'  : 'V',
"     \ 'V'  : 'V-Line',
"     \ '^V' : 'V-Bloc',
"     \ 'c'  : 'Commnd',
"     \ 's'  : 'Select',
"     \ 'S'  : 'S-Line',
"     \ '^S' : 'S-Bloc',
"     \ 't'  : 'Termnl',
"     \ }

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        let g:python3_host_prog = '/usr/local/bin/python3'
        let g:python_host_prog = '/usr/local/bin/python3'
    endif
endif

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" vimwiki
let wiki_main = {'path': $VWHOME,'index': 'README', 'syntax': 'markdown', 'ext': '.md'}
let wiki_job = {'path': $JOBHOME, 'index': 'README', 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [wiki_main, wiki_job]
" vimwiki will only set the filetype of markdown files inside a wiki directory, rather than globally
let g:vimwiki_global_ext = 0
command! Diary VimwikiDiaryIndex
command! DiaryTmr VimwikiMakeTomorrowDiaryNote
nnoremap <Leader>wg :VimwikiGoto<Space>
nnoremap gk :VimwikiToggleListItem<Cr>
let g:vimwiki_listsyms = ' .oOx'
" template for diary
function! NewDiary()
    silent! 0r $VHOME/templates/vimwiki-diary
    s/FILENAME/\=expand("%:t:r")
endfunction
au BufNewFile $VWHOME/diary/*.md call NewDiary()
au BufNewFile $JOBHOME/diary/*.md call NewDiary()
" automatically update links on read diary
autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks

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
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

vim.o.completeopt = "menu,menuone,noselect"

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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#jumpable"](1) == 1 then
        feedkey("<Plug>(vsnip-jump-next)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"})
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'vsnip' } -- For vsnip users
    }, 
    {
      { name = 'buffer' }
    }
  )
})

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
    { name = 'path' }
  }, {
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

require'nvim-tree'.setup {
  git = {
    enable = true,
    ignore = true
  },
  filters = {
    custom = {'__pycache__', 'env', '.git', 'node_modules', '.cache'}
  },
  renderer = {
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "▸",
          open = "▾",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        }
      }
    }
  }
}

-- vim-tree auto close
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python"}, 
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  }
}

EOF

" nvim-compe
"  tab to navigate completion menu
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>

" nvim-tree
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<leader>b'

