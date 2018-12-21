"Setting up vundle
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"BundleInstall
",bi - vim mapping shortcut for BundleInstall
set ruler		"ruler bottom right
set nocompatible		"be iMproved
set hidden"			"no prompt for unsaved buffers
filetype off		"required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
Bundle 'fatih/molokai'
Bundle 'morhetz/gruvbox'
Bundle 'junegunn/seoul256.vim'
Bundle 'joshdick/onedark.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/neosnippet.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'mattn/emmet-vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'jamesroutley/vim-logbook'
Bundle 'metakirby5/codi.vim'

if v:version >= 800
Bundle 'fatih/vim-go'
Bundle 'Shougo/neocomplete.vim'
Bundle 'w0rp/ale'
endif

if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
  "Enable filetype detection
  filetype plugin indent on
  "Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

if &t_Co > 2 || has("gui_running")
  "Enable syntax highlighting
  syntax on
endif
"line numering
"set relativenumber
set number
" Tab use 3 spaces
set tabstop=3
set shiftwidth=3
"autocompletion
set wildmode=list:longest
set smartindent
"set autoindent
"split below
set splitbelow
set hlsearch
set foldenable
"enable paste mode for pasted code
set pastetoggle=<F2>
"Allow backspacing in insert mode
set backspace=indent,eol,start
set visualbell           "don't beep
set noerrorbells         "don't beep

"Map f1 to nothing because I keep hitting it randomly.
inoremap <F1> <nop>
"renamp esc to jk
imap jk <Esc>
"comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>cc
"no arrow keys
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

au FileType go nmap <F8> :echo system('go run "' . expand('%') . '"')<CR>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<CR>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<CR>
au FileType c nmap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

nmap <F4> :set number! <bar> :set list! <bar> :GitGutterSignsDisable<CR>
"nerdtree
"nmap ,nt :NERDTreeToggle<CR>
nmap <F1> :NERDTreeToggle<CR>
"tabs
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>
"Nerdtree bookmark
nmap ,nb :Bookmark
nmap <leader>l :set list!<CR>
"edit .vimrc quickly
nmap ,ev :tabedit $MYVIMRC<cr>
"reload vim quickly
nmap ,rv :source $MYVIMRC<CR>
"map space rather than colon
nmap <space> :
"Shortcut for vundle
nmap ,bi :BundleInstall<cr>
"Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
"fugitive
nnoremap ,gs :Gstatus<cr>
nmap <F10> :Gstatus<CR>
nnoremap <silent> ,gpu :execute ":!git push origin master"<CR>
nmap <F9> :execute ":!git push origin master"<CR>
nnoremap ,gma :!git add . && git cm "
nnoremap ,gpd :Git pull origin master<cr>

"https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-o> <C-o>o
inoremap <C-k> <C-o>O
"surround markdown emphasis
nnoremap ,yse ciw**<C-r>"**<Esc>
nnoremap ,ysq ciw"<C-r>""<Esc>
nnoremap ,yst ciw`<C-r>"`<Esc>
nnoremap ,ysb ciw[<C-r>"]<Esc>
"vim-go :GoInstallBinaries on first open of .go file if you encounter errrors.
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"vim-airline
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
"buffer tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

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
"molokai colorscheme
silent! colorscheme onedark
"use the same symbols as TextMate for tabstops and EOLs
scriptencoding utf-8
set encoding=utf-8
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list

if has("lua") && v:version >= 800
"neocomplete
"disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
"use smartcase.
let g:neocomplete#enable_smart_case = 1
"set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
"Recommended key-mappings.
"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
endif
"nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
"neosnippets
let g:neosnippet#snippets_directory='~/.dotfiles/.snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<cr>
"plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1
"Spell checking on markdown
autocmd BufRead,BufNewFile *.md setlocal spell
au BufReadPost *.gohtml set syntax=html
"Python indentation/spacing
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set fileformat=unix

"Python syntax highlighting
let g:python_highlight_all = 1
"Hashicorp fmt
let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0
"ale
"set Prettier up to run on save
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"save automatically when text is changed
set updatetime=200
au CursorHold * silent! update
