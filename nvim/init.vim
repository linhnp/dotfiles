"set t_ut=

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set ff=unix
let $VHOME = $HOME."/.config/nvim"
let $VWHOME = $HOME."/workspace/vimwiki"
set runtimepath+=$VHOME."/bundle/vim-plug"
let mapleader = ","    " rebind <Leader> key
let g:loaded_python_provider=0
let g:python_host_skip_check=1
let g:python3_host_skip_check=1

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin($VHOME.'/bundle')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
"Plug 'Valloric/YouCompleteMe'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'altercation/vim-colors-solarized'

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
set autochdir 					" auto set current file's folder current folder
set guitablabel=%t				" set vim tab only display file name
"map <C-t> :vsp term://			" Open terminal in vertical split
"map <C-s> :sp term://			" Open terminal in hsplit
noremap <Leader>Q :ccl<CR>		" CLose quickfix
set autoindent nosmartindent
set wildignore=*.pyc

" set clipboard=unnamedplus		" mapping register to clipboard
" set clipboard=unnamed

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=r
endif

" mapping
inoremap jj <Esc>					" map jj to <ESC>
map <F7> mzgg=G					" mapping F7 to format ident
map <F8> gggqG					" mapping F7 to format ident
noremap <C-n> :nohl<CR>			" Remove hightlight of last search
noremap <Leader>s :update<CR>	" Quick save command
noremap <Leader>q :quit<CR>		" Quick quit command
vnoremap < <gv					" moving code block
vnoremap > >gv					" moving code block
map <Leader>l <C-w>l			" moving between split
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map Q gq						" Don't use Ex mode, use Q for formatting
inoremap <C-U> <C-G>u<C-U>		" Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <c-f> y<ESC>/<c-r>"<CR>
" tnoremap <Leader>T <C-\><C-n>	" Exit from Terminal mode

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
au FileType python setlocal formatprg=autopep8\ -
" template
au BufNewFile * :silent! exec ":0r ".$VHOME."/templates/".&ft
" Vim diff
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" do not show preview, when popup close, close all preview
set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" use solarized scheme
set background=light
colorscheme solarized

" highhight trailing spaces
" need to be placed after selecting scheme
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Nerdtree
let g:netrw_list_hide= '.*\.pyc$'
map <Leader>t :NERDTreeToggle<CR>			" Map to ,t
let NERDTreeShowHidden=1					" Set show hidden file
let NERDTreeShowBookmarks=1					" Enable nerdtree bookmarks
" close vim when NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp.vim
let g:ctrlp_map = '<c-p>'					" quick open ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

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
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
" remove airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.readonly = '[RO]'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ''

"let g:solarized_termcolors=256
let g:airline_mode_map = {
    \ '__' : '──────',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'RPlace',
    \ 'v'  : 'V',
    \ 'V'  : 'V-Line',
    \ '^V' : 'V-Bloc',
    \ 'c'  : 'Commnd',
    \ 's'  : 'Select',
    \ 'S'  : 'S-Line',
    \ '^S' : 'S-Bloc',
    \ 't'  : 'Termnl',
    \ }

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
let g:vimwiki_list = [{'path': $VWHOME,'index': 'README', 'syntax': 'markdown', 'ext': '.md'}]
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
" automatically update links on read diary
autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks

" Deoplete
let g:deoplete#enable_at_startup = 1
" https://jdhao.github.io/2019/06/06/nvim_deoplete_settings/
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
call deoplete#custom#source('_', 'max_menu_width', 80)
" set to Tab to move in popup
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

if filereadable(expand('~/.abbrev.vim'))
    so ~/.abbrev.vim
endif
