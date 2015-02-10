" Setting up vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall
" ,bi

set ruler				" ruler bottom right
set nocompatible		" be iMproved
set hidden 				" no prompt for unsaved buffers
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'rodjek/vim-puppet'
Bundle 'fatih/vim-go'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'

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

"syntax highlighting
"filetype on

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

"renamp esc to jk
imap jk <Esc>

"enable paste mode for pasted code
set pastetoggle=<F2>

"map space rather than colon
nmap <space> :

"Shave off shift
nnoremap ; :

"Shortcut for vundle
nmap ,bi :BundleInstall<cr>

"Run ruby code
nmap ,r :!ruby %<cr>

"perl code
:map <leader>r :!perl %<cr>

"go code
:map <leader>r :!go run %<CR>

"map F5 to toggle numbers 
map <F5> :set number!<CR>><ESC>

"tabs 
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>

"vim fugitive mappings 
nmap ,gs <Esc>:Gstatus<CR>
nmap ,gl <Esc>:Git log --pretty --pretty=oneline<CR>
nmap ,gco <Esc>:Git checkout<CR>
nmap ,gp <Esc>:Git push origin master<CR>
nmap ,ga <Esc>:Git add .<CR>

"vim comment out mappings
map ,# :s/^/\/*/<CR> <Esc>:nohlsearch <CR>
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>

"nerdtree
map ,nt :NERDTreeToggle<CR>

" Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
