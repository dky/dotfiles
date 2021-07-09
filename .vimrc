call plug#begin('~/.vim/plugged')
" nvim view/cache location
" $HOME/.local/share/nvim/view
"
" Source all plug plugins
source ~/.dotfiles/vim/plug.vim
" Load in plugin-specific-configs
call plug#end()

" Source all plugin specific configurations here
source ~/.dotfiles/vim/plugins.vim
" Load in autocommands
source ~/.dotfiles/vim/autocommands.vim
" Load in cabbrevs
source ~/.dotfiles/vim/cabbrev.vim
" Load in maps
source ~/.dotfiles/vim/maps.vim
" Load in funcs
source ~/.dotfiles/vim/functions.vim
" Load in highlighting
source ~/.dotfiles/vim/highlights.vim
" airline
source ~/.dotfiles/vim/airline.vim
" ale
"source ~/.dotfiles/vim/ale.vim
" whichkey
source ~/.dotfiles/vim/whichkey.vim
" floaterm
source ~/.dotfiles/vim/floaterm.vim
" gutentags
"source ~/.dotfiles/vim/gutentags.vim

if has('nvim')
	source ~/.dotfiles/lua/lsp.lua
	source ~/.dotfiles/lua/treesitter.lua
	"call compe for python and go for now
	autocmd BufNewFile,BufRead *.py,*.go source ~/.dotfiles/lua/compe-config.lua
	"Only use coc completion for markdown files, with the coc-dictionary
	"extension, everything else should use nvim compe until multifile
	"dictionary support is added
	"coc-plugin is only enabled for markdown files see plug.vim
	autocmd BufNewFile,BufRead *.md source ~/.dotfiles/vim/coc.vim
else
endif

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
set wildmenu
set wildmode=list:longest,full
set wildignorecase

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

" colorscheme - molokai or hybrid
silent! colorscheme hybrid

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
