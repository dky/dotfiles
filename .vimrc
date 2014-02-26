" Setting up vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall
" ,bi

set ruler				" ruler bottom right
set nocompatible		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'vim-ruby/vim-ruby'
Bundle 'henrik/vim-ruby-runner'
Bundle 'mattn/zencoding-vim'
Bundle 'rodjek/vim-puppet'
Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

"solarized
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

"syntax highlighting
filetype on

"line numering
set number

"when you hit tab go three spaces.
set tabstop=3
set shiftwidth=3

"autocompletion
set wildmode=list:longest
set smartindent
set autoindent

"split below
set splitbelow
set hlsearch
set foldenable

"source the .vimrc file after saving
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

"edit .vimrc quickly
nmap ,ev :tabedit $MYVIMRC<cr>

"turn off arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"turn off h,j,k,l
noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>

"renamp esc to jk
imap jk <Esc>

"enable paste mode for pasted code
set pastetoggle=<F2>

"map space rather than colon
nmap <space> :

"Shave off shift
nnoremap ; :

"Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

"Shortcut for vundle
nmap ,bi :BundleInstall<cr>

"Run ruby code
nmap ,r :!ruby %<cr>

"map F5 to toggle numbers 
map <F5> :set number!<CR>><ESC>
map <F4> :NERDTreeToggle<cr>

"tabs 
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>

"vim fugitive git mappings 
nmap ,gs <Esc>:Gstatus<CR>
nmap ,gl <Esc>:Git log --pretty --pretty=oneline<CR>
nmap ,gco <Esc>:Git checkout<CR>
nmap ,gp <Esc>:Git push<CR>

"Configure airline.
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
