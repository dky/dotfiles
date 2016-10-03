" Setting up vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall
" ,bi - vim mapping shortcut for BundleInstall
set ruler		" ruler bottom right
set nocompatible		" be iMproved
set hidden"			" no prompt for unsaved buffers
filetype off		" required!
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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'plasticboy/vim-markdown'
Bundle 'junegunn/goyo.vim'

if has("autocmd")
  " autocmd bufwritepost .vimrc source $MYVIMRC
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
" line numering
set number
" Tab use 3 spaces
set tabstop=3
set shiftwidth=3
"autocompletion
set wildmode=list:longest
set smartindent
" set autoindent
" split below
set splitbelow
set hlsearch
set foldenable
" enable paste mode for pasted code
set pastetoggle=<F2>
" Allow backspacing in insert mode
set backspace=indent,eol,start
set visualbell           " don't beep
set noerrorbells         " don't beep
" renamp esc to jk
imap jk <Esc>
" no arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" run perl
map <leader>r :!perl %<cr>
" run go
map <leader>r :!go run %<CR>
" run c
map <leader>c :!gcc % && ./a.out<CR>
" F5 to toggle numbers 
map <F5> :set number!<CR>><ESC>
" F4 to toggle numbers off + toggle of special characters
map <F4> :set number! <bar> :set list!<CR>
" comment out code mappings
map ,# :s/^/\/*/<CR> <Esc>:nohlsearch <CR>
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
" nerdtree
map ,nt :NERDTreeToggle<CR>
" shortcut to rapidly toggle `set list` hidden characters
nmap <leader>l :set list!<CR>
" edit .vimrc quickly
nmap ,ev :tabedit $MYVIMRC<cr>
" map space rather than colon
nmap <space> :
" Shortcut for vundle
nmap ,bi :BundleInstall<cr>
" ruby code
nmap ,r :!ruby %<cr>
" fugitive
nmap ,gs :Gstatus<cr>
nmap ,gpu :Git push origin master<cr>
nmap ,gpd :Git pull origin master<cr>
nmap ,gcm :Git cm "
nmap ,gma :Git add . && Git cm "
nmap ,gl :Git log --pretty --pretty=oneline<CR>
nmap ,ga :Git add .<CR>
" tabs
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>
" vim-go - run gofmt on save
let g:go_fmt_autosave = 0
nmap ,nb :Bookmark 
" Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
" enable vim-airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
" buffer tabs
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
" set statusline at the bottom
set laststatus=2
" molokai colorscheme
silent! colorscheme molokai
" use the same symbols as TextMate for tabstops and EOLs
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list
" ctrlp
let g:ctrlp_map = '<c-p>'
" neocomplete
" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" use smartcase.
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" neosnippets
let g:neosnippet#snippets_directory='~/.dotfiles/.snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1
" hugo
:command! -nargs=1 Hnp exe '!hugo new posts/<args>'
"vim-go highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
