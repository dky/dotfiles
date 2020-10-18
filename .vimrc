call plug#begin('~/.vim/plugged')
" nvim view/cache location
" $HOME/.local/share/nvim/view

if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	" Go
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make', 'for': 'go' }
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

	" Python
	" pip3 install --user pynvim
	Plug 'zchee/deoplete-jedi', { 'for': 'python' }
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }
	Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

	" JS
	Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern', 'for': 'javascript' }
else
endif

Plug 'vim-test/vim-test'
Plug 'deoplete-plugins/deoplete-dictionary'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'thaerkh/vim-indentguides', { 'for': ['go', 'python', 'neosnippet', 'sh', 'yaml', 'tf'] }
Plug 'voldikss/vim-floaterm'
Plug 'kassio/neoterm'
Plug 'hashivim/vim-terraform'
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'jamesroutley/vim-logbook'
Plug 'metakirby5/codi.vim'
Plug 'rhysd/vim-clang-format'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kana/vim-arpeggio'
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'roxma/vim-tmux-clipboard'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'luochen1990/rainbow'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1

call plug#end()

filetype on
set ruler
set nocompatible
set hidden

" no backups and swap
set noswapfile
set nobackup
set number
"set relativenumber
"
set tabstop=3
set shiftwidth=3
set smartindent

" autocompletion
set wildmode=list:longest

" split below
set splitbelow
set hlsearch
set incsearch
set foldenable

" enable paste mode for pasted code
set pastetoggle=<F2>

" allow backspacing in insert mode
set backspace=indent,eol,start
set visualbell           "don't beep
set noerrorbells         "don't beep

" set statusline at the bottom
set laststatus=2

" molokai colorscheme
silent! colorscheme molokai

" used for vimscripts
scriptencoding utf-8

" gitgutter
set updatetime=100

set encoding=utf-8
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list

if has("noinsert")
	"neocomplete like
	set completeopt+=noinsert
elseif has ("noselect")
	set completeopt+=noselect
endif

set cursorline
" default colors for CursorLine
" https://jonasjacek.github.io/colors
hi CursorLine ctermbg=236
" change Color when entering Insert Mode
autocmd InsertEnter * hi CursorLine ctermbg=24
" revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine ctermbg=236
" autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;" This
hi LineNr ctermbg=236 ctermfg=246
hi Visual ctermbg=190 ctermfg=16
hi Comment ctermfg=43
" search colors
hi Search cterm=NONE ctermfg=white ctermbg=238

" spelling and dictionary support
" vim underline spelling errors don't color them.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=yellow
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

" restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" neosnippets
" You can :set noet|%retab! in your .snip file to replace all spaces with hard tabs, that way the extra indentation is fixed!
" https://github.com/Shougo/neosnippet.vim/issues/445
au BufNewFile,BufRead *.snip
			\ set noet|%retab!

" golang
au BufNewFile,BufRead *.go
			\ set noexpandtab |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4

" js, html, css
au BufNewFile,BufRead *.js,*.html,*.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" markdown
au BufNewFile,BufRead *.md
			\ set noautoindent |
			\ set nocindent |
			\ set nosmartindent |
			\ set indentexpr=

" yaml
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" .gohtml files should be html
au BufReadPost *.gohtml set syntax=html

augroup remember_folds
	autocmd!
	" https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
	" autocmd BufWinLeave * mkview
	" autocmd BufWinEnter * silent! loadview
	" view files are about 500 bytes
	" bufleave but not bufwinleave captures closing 2nd tab
	" nested is needed by bufwrite* (if triggered via other autocmd)
	autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
	autocmd BufWinEnter ?* silent! loadview
augroup END

" create dir that does not exist on save
" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup createDirIfNoneExists
	autocmd!
	autocmd BufWritePre *
				\ if !isdirectory(expand("<afile>:p:h")) |
				\ call mkdir(expand("<afile>:p:h"), "p") |
				\ endif
augroup END

" When opening markdown files call WordProcessorMode
au BufNewFile,BufRead *.md call WordProcessorMode()

" Load in cabbrevs
if !empty(glob("~/.dotfiles/.vim_cabbrev.vim"))
	source ~/.dotfiles/.vim_cabbrev.vim
endif

" Load in maps
if !empty(glob("~/.dotfiles/.vim_maps.vim"))
	source ~/.dotfiles/.vim_maps.vim
endif

" Load in funcs
if !empty(glob("~/.dotfiles/.vim_functions.vim"))
	source ~/.dotfiles/.vim_functions.vim
endif

" Load in plugin-specific-configs
if !empty(glob("~/.dotfiles/.vim_plugins.vim"))
	source ~/.dotfiles/.vim_plugins.vim
endif

" space code appropriately for file type.
autocmd BufNewFile,BufRead * call s:DetectNode()

" If a file is detected as bash set it to sh
function! s:DetectNode()
	if getline(1) == '#!/bin/bash'
		set ft=sh
	endif
endfun
