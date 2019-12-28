call plug#begin('~/.vim/plugged')

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Go
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
	" Python
	Plug 'zchee/deoplete-jedi'
	" JS
	Plug 'carlitux/deoplete-ternjs'
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
else
endif

Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'jamesroutley/vim-logbook'
Plug 'metakirby5/codi.vim'
Plug 'rhysd/vim-clang-format'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kana/vim-arpeggio'
Plug 'benmills/vimux'
Plug 'rodjek/vim-puppet'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'roxma/vim-tmux-clipboard'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
" writing plugins
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'
" Override colorscheme defaults, I needed this because the pmenu popup was too
" dark and wanted to use a lighter popup color
" Customizations are stored in ~/.vim/after/colors/molokai.vim
" https://stackoverflow.com/questions/10454038/setting-vim-omnicompletion-colors-pmenu-in-vimrc-not-working
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'kchmck/vim-coffee-script'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

filetype on
set ruler
set nocompatible
set hidden

" no backups and swap
set noswapfile
set nobackup
set number
set relativenumber

" tab use 3 spaces
set tabstop=3
set shiftwidth=3

" autocompletion
set wildmode=list:longest

" set autoindent
set smartindent

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

set encoding=utf-8
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list

" codi
nnoremap <silent> ,cd :execute ":Codi"<CR>
cabbrev oc Codi
cabbrev ec Codi!

" close all buffers
function! CloseAllBuffersButCurrent()
	let curr = bufnr("%")
	let last = bufnr("$")

	if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
	if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" Short for "Close all buffers" - Closes all open buffers except current.
cabbrev cab :call CloseAllBuffersButCurrent()<CR>

" remap esc to jk
imap jk <Esc>

" comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>

" no l/r arrow keys
nmap <left> <nop>
nmap <right> <nop>

au FileType go nmap <F8> :w <CR> :echo system('go run "' . expand('%') . '"')<CR>
au FileType go imap <F8> <Esc> :w <CR> :echo system('go run "' . expand('%') . '"')<CR>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType python imap <F8> <Esc> :w <CR> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<CR>
au FileType javascript imap <F8> <Esc> :w <CR> :echo system('node "' . expand('%') . '"')<CR>
au FileType coffee nmap <F8> :echo system('coffee "' . expand('%') . '"')<CR>
au FileType coffee imap <F8> <Esc> :w <CR> :echo system('coffee "' . expand('%') . '"')<CR>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<CR>
au FileType c nmap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au FileType c imap <F8> <Esc> :w <CR> :!gcc % -o %< && ./%< <CR>

" Disable line numbers, relative line numbers, Git Gutter and any spacing
" symbols.
function! NumberToggle()
	if(&relativenumber == 1 && &number == 1 && &list == 1)
		set norelativenumber
		set nonumber
		set nolist
		GitGutterDisable
		ALEToggle
	else
		set relativenumber
		set number
		set list
		GitGutterEnable
		ALEToggle
	endif
endfunc

nnoremap <F4> :call NumberToggle()<cr>
" Disable relative numbers
cabbrev norel set relativenumber!

" tagbar toggle
nmap ,tb :TagbarToggle<CR>

" map f1 vim help to esc, kept bringing up the help menu in insert mode
imap <F1> <Esc>

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nmap ,nt :NERDTreeToggle<CR>
nmap <F1> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\.go.mod$', '\.DS_Store$', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" refresh nerdtree
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" tabs
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>

" Nerdtree bookmark
nmap ,nb :Bookmark

" edit .vimrc quickly
nmap ,ev :tabedit $HOME/.vimrc<CR>
nmap ,ch :CheckHealth<CR>
nmap ,up :UpdateRemotePlugins<CR>
" shortcut for vundle
nmap ,bi :PlugInstall<CR>
nmap ,gib :GoInstallBinaries<CR>

" reload vim quickly
nmap ,rv :source $MYVIMRC<CR>
cabbrev rv source $MYVIMRC<CR>

" map space rather than colon
nmap <space> :

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" fugitive
nnoremap <silent> ,gpu :execute ":!git push origin master"<CR><CR>
nnoremap <F9> :execute ":!git push origin master"<CR>
nnoremap ,gma :!git add . && git cm "
nnoremap <F10> :!git add . && git cm "
imap <F10> <Esc> :!git add . && git cm "
nnoremap ,gpd :Git pull origin master<CR>

cabbrev gco Git checkout %
cabbrev grh Git reset --hard
cabbrev gs Git status
cabbrev gd Git diff
cabbrev gpu Git push origin master

" https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O

" surround markdown emphasis
nnoremap ,s* ciw**<C-r>"**<Esc>
nnoremap ,s" ciw"<C-r>""<Esc>
nnoremap ,s` ciw`<C-r>"`<Esc>
nnoremap ,s[ ciw[<C-r>"]<Esc>

" vim-go
" Don't show warnings if we are not using nvim or > 7.4.1099, thanks RedHat...
let g:go_version_warning = 0
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
let g:go_fmt_experimental = 1

" shorter aliases for vim-go plugin
au FileType go nmap <leader><F12> :GoDecls<CR>
au FileType go nmap <F12> <Plug>(go-def)

cabbrev gi GoImport
cabbrev gd GoDrop
cabbrev gf GoFmt
cabbrev gt GoTest

" vim-airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" buffer tabs
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

" neosnippets
" reload snippets
nnoremap ,rs :call neosnippet#variables#set_snippets({})<cr>
cabbrev rs call neosnippet#variables#set_snippets({})<cr>

let g:neosnippet#snippets_directory='~/.dotfiles/.snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
" Autosave broke snippet expansion
" https://github.com/Shougo/neosnippet.vim/issues/331
" :help g:neosnippet#enable_auto_clear_markers
let g:neosnippet#enable_auto_clear_markers = 0

imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<CR>

" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1

" Spell check markdown
" autocmd BufRead,BufNewFile *.md setlocal spell
au BufReadPost *.gohtml set syntax=html

" Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" Python add trailing space when using #
autocmd BufRead,BufNewFile *.py inoremap # #<space>

" quickly set file type
cabbrev sfp set ft=python

" Python syntax highlighting
" Disabled because we use semshi...
"let g:python_highlight_all = 1
" Toggle ale on and off.
cabbrev at ALEToggle<CR>


" ale
let g:ale_linters = {'go': ['gometalinter', 'gofmt'],}
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_linters = {'python': ['flake8'],}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['python'] = ['remove_trailing_lines', 'isort', 'ale#fixers#generic_python#BreakUpLongLines', 'yapf']

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

let g:ale_fix_on_save = 1

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 0

let g:airline#extensions#ale#enabled = 1

" clangformat C code
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

set omnifunc=syntaxcomplete#Complete

" tmux-send keys to send commands to other panes.
au FileType go nmap <F5> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
au FileType go imap <F5> <Esc> :w <CR> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,rg :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
au FileType go nmap <F5><F5> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
au FileType go imap <F5><F5> <Esc> :w <CR> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,gr :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,c :execute ":!tmux send-keys -t 3 C-c"<CR><CR>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 3 clear"<CR><CR>
au FileType python nmap <F5> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<CR><CR>
au FileType python imap <F5> <Esc> :w <CR> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<CR><CR>

nnoremap <silent> ,dkps :execute ":!tmux send-keys -t 2 'docker ps' C-m"<CR><CR>
nnoremap <silent> ,mpl :execute ":!tmux send-keys -t 2 'make post-linux' C-m"<CR><CR>
nnoremap <silent> ,mpr :execute ":!tmux send-keys -t 2 'make post-registrator' C-m"<CR><CR>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 2 'clear' C-m"<CR><CR>
nnoremap <silent> ,pa :execute ":!tmux send-keys -t 2 './apply.sh' C-m"<CR><CR>

" run the current file with rspec
let g:VimuxPromptString = "run: "
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" fzf
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" goyo
cabbrev gy Goyo

" Redhat 7.x deoplete support
" deoplete.nvim recommend
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

" tern
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

if has("noinsert")
	"neocomplete like
	set completeopt+=noinsert
elseif has ("noselect")
	set completeopt+=noselect
endif

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" deoplete tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" create dir that does not exist on save
" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup createDirIfNoneExists
	autocmd!
	autocmd BufWritePre *
				\ if !isdirectory(expand("<afile>:p:h")) |
				\ call mkdir(expand("<afile>:p:h"), "p") |
				\ endif
augroup END

set cursorline
" default colors for CursorLine
" https://jonasjacek.github.io/colors
hi CursorLine ctermbg=236
" change Color when entering Insert Mode
autocmd InsertEnter * hi CursorLine ctermbg=24
" revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine ctermbg=236
" autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;" This 
hi LineNr ctermbg=236 ctermfg=246
hi Visual ctermbg=190 ctermfg=16
hi Comment ctermfg=43
" search colors
hi Search cterm=NONE ctermfg=white ctermbg=238

" vim-logbook
noremap ,lb :Lb<cr>
noremap ,ts :Ts<cr>

" spelling and dictionary support
" vim underline spelling errors don't color them.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=yellow
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

" vim-lexical
augroup lexical
	autocmd!
	autocmd FileType markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#dictionary = ['/usr/share/dict/words','~/.vim/dict/custom.txt']
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#spell_key = '<leader>s'
let g:lexical#dictionary_key = '<leader>k'

" proselint
call ale#linter#Define('text', {
			\   'name': 'proselint',
			\   'executable': 'proselint',
			\   'command': 'proselint %t',
			\   'callback': 'ale#handlers#unix#HandleAsWarning',
			\})

" restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Code Spacing
" python
au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 | 
			\ set textwidth=79 |
			\ set expandtab | 
			\ set autoindent |
			\ set fileformat=unix

" go
au BufNewFile,BufRead *.go
			\ set noexpandtab |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4

" js, html, css
au BufNewFile,BufRead *.js,*.html,*.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

au BufNewFile,BufRead *.md
			\ set noautoindent |
			\ set nocindent |
			\ set nosmartindent |
			\ set indentexpr=

" vim sneak
let g:sneak#label = 1
map ,s <Plug>Sneak_s
map ,S <Plug>Sneak_S

augroup remember_folds
	autocmd!
	" https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
	" autocmd BufWinLeave * mkview
	" autocmd BufWinEnter * silent! loadview
	" view files are about 500 bytes
	" bufleave but not bufwinleave captures closing 2nd tab
	" nested is needed by bufwrite* (if triggered via other autocmd)
	autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
	autocmd BufWinEnter ?* silent! loadview
augroup END

let g:auto_save = 1  " enable AutoSave on Vim startup

" autoclose
inoremap " ""<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" semshi default highlight color SteelBlue3
function MyCustomHighlights()
	hi semshiSelected ctermfg=231 ctermbg=68
endfunction
autocmd FileType python call MyCustomHighlights()
