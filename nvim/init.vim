"set t_ut=

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set runtimepath+=~/.config/nvim/bundle/vim-plug

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/bundle')

Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
" Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()

" Plug said it already runs these command
" filetype plugin indent on
" syntax enable

"
" Option
"

set tabstop=4					" set tab width
set shiftwidth=4
set nobackup					" set no backup file
set nowritebackup
set noswapfile					" set no swap file
set pastetoggle=<F2>			" text will not be automatically indented when pasting
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set rnu 						" display line number
set t_Co=256 					" set to use 256 color
set autochdir 					" auto set current file's folder current folder
set guitablabel=%t				" set vim tab only display file name
tnoremap <Leader>T <C-\><C-n>	" Exit from Terminal mode
map <C-t> :vsp term://			" Open terminal in vertical split
map <C-s> :sp term://			" Open terminal in hsplit
noremap <Leader>Q :ccl<CR>		" CLose quickfix


" set clipboard=unnamedplus		" mapping register to clipboard
" set clipboard=unnamed

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=r
endif

"
" mapping
"

let mapleader = ","				" rebind <Leader> key
imap jj <Esc>					" map jj to <ESC>
map <F7> mzgg=G					" mapping F7 to format ident
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
nnoremap <F6> :set nornu!<CR>	" mapping F6 to nonumber
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <c-f> y<ESC>/<c-r>"<CR>

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

		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

		" Brief " Automatic reloading of .vimrc
		autocm! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

	augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif


" do not show preview, when popup close, close all preview
set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"
" Plugins Setting
"

" Nerdtree
map <Leader>t :NERDTreeToggle<CR>			" Map to ,t
let NERDTreeShowHidden=1					" Set show hidden file
let NERDTreeShowBookmarks=1					" Enable nerdtree bookmarks
" close vim when NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp.vim
let g:ctrlp_map = '<c-p>'					" quick open ctrlp
let g:ctrlp_cmd = 'CtrlP'

" The Silver Searcher
if executable('ag')
	" use Ag with [ack.vim]
	" let g:ackprg = 'ag --nogroup --nocolor --column'

	" Use ag in CtrlP for listing files. Lightning fast and respects
	" .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" ag search
" noremap <Leader>\ :Ack<SPACE>

" NeoSolarized
"set termguicolors
"silent! colorscheme NeoSolarized
"set background=dark

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
"let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
"let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
"let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
"let g:neosolarized_bold = 1
"let g:neosolarized_underline = 1
"let g:neosolarized_italic = 0

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

" map TLeader>t :call ToggleVExplorer()<CR>
