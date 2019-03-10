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
Bundle 'rstacruz/vim-closer'
Bundle 'fatih/molokai'
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
Bundle 'plasticboy/vim-markdown'
Bundle 'mattn/emmet-vim'
Bundle 'jamesroutley/vim-logbook'
Bundle 'metakirby5/codi.vim'
Bundle 'rhysd/vim-clang-format'
Bundle 'junegunn/goyo.vim'
Bundle 'iberianpig/tig-explorer.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kana/vim-arpeggio'
Bundle 'benmills/vimux'
Bundle 'rodjek/vim-puppet'

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

"Set a better visual color for dark backgrounds when selecting.
"hi Visual cterm=bold ctermbg=Blue ctermfg=NONE
"line numbering
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
"nmap <F7> <leader>cc
"vmap <F7> <leader>cc
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>
"no arrow keys
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

au FileType go nmap <F8> :echo system('go run "' . expand('%') . '"')<CR>
au FileType go imap <F8> <Esc> :w <CR> :echo system('go run "' . expand('%') . '"')<CR>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<CR>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<CR>
au FileType c nmap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au FileType c imap <F8> <Esc> :w <CR> :!gcc % -o %< && ./%< <CR>

nmap <F4> :set number! <bar> :set list! <bar> :GitGutterSignsDisable<CR>
"nerdtree
"nmap ,nt :NERDTreeToggle<CR>
nmap <F1> :NERDTreeToggle<CR>
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,go.mod,go.sum
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen=1
"Indent code
nmap <F3> gg=G'.
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
nnoremap <F11> :Gstatus<CR>
nnoremap <silent> ,gpu :execute ":!git push origin master"<CR><CR>
nnoremap <F9> :execute ":!git push origin master"<CR>
nnoremap ,gma :!git add . && git cm "
nnoremap <F10> :!git add . && git cm "
nnoremap ,gpd :Git pull origin master<CR>

"https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-o> <C-o>o
inoremap <C-k> <C-o>O
"Get me out of functions without a bunch of keystrokes.
inoremap <C-y> <C-o><S-}>
nnoremap <C-y> <C-o><S-}>

"surround markdown emphasis
nnoremap ,yse ciw**<C-r>"**<Esc>
nnoremap ,ysq ciw"<C-r>""<Esc>
nnoremap ,yst ciw`<C-r>"`<Esc>
nnoremap ,ysb ciw[<C-r>"]<Esc>
"vim-go :GoInstallBinaries on first open of .go file if you encounter errrors.
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
"Shorter aliases for vim-go plugin
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <F12> <Plug>(go-def)
"
cabbrev gi GoImport
cabbrev gf GoFmt
cabbrev gd GoDoc
"vim-airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
"buffer tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

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
silent! colorscheme molokai
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
let g:ale_linters = {
    \   'go': ['gometalinter', 'gofmt'],
\}
"set Prettier up to run on save
"let g:ale_linters = {'javascript': ['eslint'],}
"let g:ale_fixers = {}
"let g:ale_fixers['javascript'] = ['prettier', 'eslint']
"let g:ale_fix_on_save = 1
"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
"let g:airline#extensions#ale#enabled = 1
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"save automatically when text is changed
set updatetime=200
au CursorHold * silent! update

"Clangformat C code
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

set omnifunc=syntaxcomplete#Complete

"Turn off swp files because they are so annoying, rely on autosave instead.
"set noswapfile
"autocmd TextChanged,TextChangedI <buffer> silent write
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//"
set viminfo+=n~/.vim/viminfo

"auto save leave insert mode
autocmd InsertLeave * update
"Shorter aliases for ctrl-p search buffers
cabbrev sb CtrlPBuffer

"Reload go for now. Until I read about other methods, this will have to do.
nnoremap <silent> ,rg :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,gr :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,c :execute ":!tmux send-keys -t 3 C-c"<CR><CR>
nnoremap <silent> ,dkps :execute ":!tmux send-keys -t 2 'docker ps' C-m"<CR><CR>
nnoremap <silent> ,mpl :execute ":!tmux send-keys -t 2 'make post-linux' C-m"<CR><CR>
nnoremap <silent> ,mpr :execute ":!tmux send-keys -t 2 'make post-registrator' C-m"<CR><CR>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 2 'clear' C-m"<CR><CR>

" Run the current file with rspec
let g:VimuxPromptString = ":"
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

"vim-arpeggio
call arpeggio#map('n', '', 0, 'vp', ':VimuxPromptCommand<CR>')
