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
Bundle 'fatih/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'honza/vim-snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'

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

"line numering
set number

"when you hit tab use 3 spaces
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

" vim fugitive
nmap ,gs <Esc>:Gstatus<CR>
nmap ,gl <Esc>:Git log --pretty --pretty=oneline<CR>
nmap ,gpu <Esc>:Git push origin master<CR>
nmap ,ga <Esc>:Git add .<CR>

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" Buffer tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"set statusline at the bottom
set laststatus=2

" neocomplete
let g:neocomplete#enable_at_startup = 1

" neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" My personal snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"molokai colorscheme
colorscheme molokai

"" Shortcut to rapidly toggle `set list` hidden characters
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
