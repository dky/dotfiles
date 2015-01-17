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
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'rodjek/vim-puppet'
Bundle 'mattn/emmet-vim'
Bundle 'godlygeek/tabular'
Bundle 'msanders/snipmate.vim'
Bundle 'fatih/vim-go'
Bundle 'kchmck/vim-coffee-script'

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

"turn off h,j,k,l
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

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
nmap ,gp <Esc>:Git push origin master<CR>
nmap ,ga <Esc>:Git add .<CR>

"perl code
:map <leader>r :!perl %<cr>

"Tabular plugin
if exists(":Tabularize")
	nmap <Leader>a> :Tabularize /=><CR>
	vmap <Leader>a> :Tabularize /=><CR>
endif

let g:netrw_liststyle=3

