call plug#begin('~/.vim/plugged')
" nvim view/cache location
" $HOME/.local/share/nvim/view

if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	" pip3 install --user pynvim
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
endif

Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-test/vim-test'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'thaerkh/vim-indentguides', { 'for': ['go', 'python', 'neosnippet', 'sh', 'yaml', 'tf', 'json', 'html', 'js'] }
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
Plug 'fatih/vim-hclfmt'
Plug 'b4b4r07/vim-hcl'
"Ctags pre-requisite
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plug 'ludovicchabant/vim-gutentags'


let g:rainbow_active = 1

call plug#end()

filetype on
set ruler
set nocompatible
set hidden

" no backups and swap
set noswapfile
set nobackup
set number

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

set cursorline

if has("noinsert")
	"neocomplete like
	set completeopt+=noinsert
elseif has ("noselect")
	set completeopt+=noselect
endif

" Load in autocommands
source ~/.dotfiles/.vim_autocommands.vim
" Load in cabbrevs
source ~/.dotfiles/.vim_cabbrev.vim
" Load in maps
source ~/.dotfiles/.vim_maps.vim
" Load in funcs
source ~/.dotfiles/.vim_functions.vim
" Load in plugin-specific-configs
source ~/.dotfiles/.vim_plugins.vim
" Load in highlighting
source ~/.dotfiles/.vim_highlights.vim

" This should be broken out into .vim_plugins and .vim_autocommands but don't know why it fails currently.
" space code appropriately for file type.
autocmd BufNewFile,BufRead * call s:DetectNode()

" If a file is detected as bash set it to sh
function! s:DetectNode()
	if getline(1) == '#!/bin/bash'
		set ft=sh
	endif
endfun
