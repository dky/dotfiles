call plug#begin('~/.vim/plugged')
" nvim view/cache location
" $HOME/.local/share/nvim/view
"
" Source all plugins
source ~/.dotfiles/.vim_plug.vim
" Load in plugin-specific-configs
source ~/.dotfiles/.vim_plugins.vim
call plug#end()

" Load in autocommands
source ~/.dotfiles/.vim_autocommands.vim
" Load in cabbrevs
source ~/.dotfiles/.vim_cabbrev.vim
" Load in maps
source ~/.dotfiles/.vim_maps.vim
" Load in funcs
source ~/.dotfiles/.vim_functions.vim
" Load in highlighting
source ~/.dotfiles/.vim_highlights.vim
" gutentags
source ~/.dotfiles/.vim_gutentags.vim
" coc
source ~/.dotfiles/.vim_coc.vim
" airline
source ~/.dotfiles/.vim_airline.vim
" ale
source ~/.dotfiles/.vim_ale.vim

filetype on
set ruler
set nocompatible
set hidden
set mouse=a

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

