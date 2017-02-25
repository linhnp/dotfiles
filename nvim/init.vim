"set t_ut=

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

if &compatible
	set nocompatible
endif
set runtimepath+=~/.config/nvim/bundle/vim-plug

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/bundle')

Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()

" Plug said it already runs these command
" filetype plugin indent on
" syntax enable

" Brief " Automatic reloading of .vimrc
autocm! bufwritepost ~/.config/nvim/init.vim source %

" text will not be automatically indented when pasting
set pastetoggle=<F2>

" map jj to <ESC>
imap jj <Esc>

" mapping register to clipboard
" set clipboard=unnamedplus
set clipboard=unnamed

" mapping F7 to format ident
map <F7> mzgg=G

" mapping F6 to nonumber
nnoremap <F6> :set nonumber!<CR>

" rebind <Leader> key
let mapleader = ","

" Remove hightlight of last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quick save command
noremap <Leader>s :update<CR>

" Quick quit command
noremap <Leader>q :quit<CR>

"moving code block
vnoremap < <gv
vnoremap > >gv

" moving between split
map <Leader>l <C-w>l
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k

" set no backup file
set nobackup
set nowritebackup
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=r
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
" auto command: auto execute when reading or writing a file
" Refer: http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
if has("autocmd")
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") >= 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.  If unset (default), this may break plugins (but it's backward
	" compatible).
	set langnoremap
endif

" set tab width
set tabstop=4
set shiftwidth=4
set smarttab

set number " display line number
set t_Co=256 " set to use 256 color

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

" set to use Ctrl-j, Ctrl-k to move in popup
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" do not show preview, when popup close, close all preview
set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" open/close folder tree
" function! ToggleVExplorer()
"  if exists("t:expl_buf_num")
"      let expl_win_num = bufwinnr(t:expl_buf_num)
"      if expl_win_num != -1
"          " let cur_win_nr = winnr()
"          exec expl_win_num . 'wincmd w'
"          close
"          " exec cur_win_nr . 'wincmd w'
"	  endif
"	  unlet t:expl_buf_num
"  else
"      exec '1wincmd w'
"      Vexplore
"      let t:expl_buf_num = bufnr("%")
"  endif
" endfunction

" map <Leader>t :call ToggleVExplorer()<CR>

" for nerdtree
map <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" close vim when NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks=1

set autochdir "auto set current file's folder current folder

" status line
set laststatus=2 "set statusline always show

"quick find and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <c-f> y<ESC>/<c-r>"<CR>

" supertab
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabDefaultCompletionType = "context"

" php-namspaces
function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" tags
set tags=./tags;/

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" The Silver Searcher
if executable('ag')
	" use Ag with [ack.vim]
	let g:ackprg = 'ag --nogroup --nocolor --column'

	" Use ag in CtrlP for listing files. Lightning fast and respects
	" .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" ag search
" let g:ag_working_path_mode="r"
" nnoremap <Leader>\ :Ag<SPACE>
"vnoremap <c-F> y<ESC>:Ag<SPACE><c-r>"<CR>

" set vim tab only display file name
set guitablabel=%t

" NeoSolarized
set termguicolors

silent! colorscheme NeoSolarized

set background=dark

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" set vim-airline to use powerline font
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:solarized_termcolors=256
