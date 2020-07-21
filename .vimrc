call plug#begin('~/.vim/plugged')

if has('nvim')
	" pip3 install --user pynvim
	" Do this at the OS level, then Run :UpdateRemotePlugins
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Go
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
	" Python
	Plug 'zchee/deoplete-jedi'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'jeetsukumaran/vim-pythonsense'
	" JS
	Plug 'carlitux/deoplete-ternjs'
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
	" neco-look is a plugin to auto expand dictionary words using `look`"
	Plug 'ujihisa/neco-look'
else
endif
let g:deoplete#enable_at_startup = 1


"nvim view/cache location
"$HOME/.local/share/nvim/view

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
Plug 'johngrib/vim-mac-dictionary'
Plug 'dpelle/vim-LanguageTool'
" Override colorscheme defaults, I needed this because the pmenu popup was too
" dark and wanted to use a lighter popup color
" Customizations are stored in ~/.vim/after/colors/molokai.vim
" https://stackoverflow.com/questions/10454038/setting-vim-omnicompletion-colors-pmenu-in-vimrc-not-working
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'kchmck/vim-coffee-script'
Plug 'thaerkh/vim-indentguides'
Plug 'luochen1990/rainbow'

let g:rainbow_active = 1

call plug#end()

filetype on
set ruler
set nocompatible
set hidden

" no backups and swap
set noswapfile
set nobackup
set number
"set relativenumber
"
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

set encoding=utf-8
set listchars=eol:¬,tab:▸-,trail:~,extends:>,precedes:<
set list

" codi
nnoremap <silent> ,cd :execute ":Codi"<cr>
cabbrev oc Codi
cabbrev ec Codi!

let g:codi#width = winwidth(winnr()) / 2
let g:codi#rightalign = 0

" Short for "Close all buffers" - Closes all open buffers except current.
cabbrev cab call CloseAllBuffersButCurrent()<cr>

" remap esc to jk
imap jk <Esc>

" comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>

" no l/r arrow keys
nmap <left> <nop>
nmap <right> <nop>

au FileType go nmap <F8> :w <cr> :echo system('go run "' . expand('%') . '"')<cr>
au FileType go imap <F8> <Esc> :w <cr> :echo system('go run "' . expand('%') . '"')<cr>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<cr>
au FileType python imap <F8> <Esc> :w <cr> :echo system('python3 "' . expand('%') . '"')<cr>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<cr>
au FileType javascript imap <F8> <Esc> :w <cr> :echo system('node "' . expand('%') . '"')<cr>
au FileType coffee nmap <F8> :echo system('coffee "' . expand('%') . '"')<cr>
au FileType coffee imap <F8> <Esc> :w <cr> :echo system('coffee "' . expand('%') . '"')<cr>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<cr>
au FileType c nmap <F8> :w <cr> :!gcc % -o %< && ./%< <cr>
au FileType c imap <F8> <Esc> :w <cr> :!gcc % -o %< && ./%< <cr>

" Disable line numbers, relative line numbers, Git Gutter and any spacing
" symbols.
function! NumberToggle()
	"if(&relativenumber == 1 && &number == 1 && &list == 1)
	if(&number == 1 && &list == 1)
		"set norelativenumber
		set nonumber
		set nolist
		GitGutterDisable
		ALEToggle
		IndentGuidesToggle
	else
		"set relativenumber
		set number
		set list
		GitGutterEnable
		ALEToggle
		IndentGuidesToggle
	endif
endfunc

" close all buffers
function! CloseAllBuffersButCurrent()
	let curr = bufnr("%")
	let last = bufnr("$")

	if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
	if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" This func is necessary to remove the additional whitespace added after
" cabbrev, see cabbrev gma as an example
func! Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" Check to ensure we aren't in a nerdtree file browser when running command
function! IsNerdTreeOpen(command_str)
	if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
		exe "normal! \<c-w>\<c-w>"
	endif
	exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" function to create directory and cd into it.
function! CreateDailyFolder()
	let tstamp = strftime("%m-%d-%y")
	let folderpath = $HOME."/git/cb/daily/".tstamp
	let cmd = 'cd ' . folderpath
	if !isdirectory(folderpath)
		echo 'Dir does not exist, creating:' folderpath
		call mkdir(folderpath, 'p')
		echo 'Switching working dir to:' folderpath
	else
		echo 'Switching working dir to:' folderpath
		execute cmd
	endif
endfunction

" semshi default highlight color SteelBlue3
function! SemshiCustomHighlights()
	hi semshiSelected ctermfg=231 ctermbg=237
endfunction

" Function to copy current buffer into a new file without manually writing and
" re-opening
function! CopyCurrentFile()
	let old_name = expand('%')
	let new_name = input('Copy to file name: ',)
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		redraw!
	endif
endfunction

nnoremap <F4> :call NumberToggle()<cr>
" Disable relative numbers
cabbrev norel set relativenumber!

" tagbar toggle
nmap ,tb :TagbarToggle<cr>

" map f1 vim help to esc, kept bringing up the help menu in insert mode
imap <F1> <Esc>

" nerdtree
" Open nerdtree on startup.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nmap ,nt :NERDTreeToggle<cr>
nmap <F1> :NERDTreeToggle<cr>

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

" Nerdtree bookmark
nmap ,nb :Bookmark

" edit .vimrc quickly
nmap ,ev :tabedit $HOME/.dotfiles/.vimrc<cr>
nmap ,ch :CheckHealth<cr>
nmap ,up :UpdateRemotePlugins<cr>
" shortcut for vundle
nmap ,bi :PlugInstall<cr>
cabbrev bi PlugInstall<cr>
nmap ,gib :GoInstallBinaries<cr>

" reload vim quickly
nmap ,rv :source $MYVIMRC<cr>
cabbrev rv :source $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>

" map space rather than colon
nmap <space> :

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

nnoremap <silent> <leader>gs :call IsNerdTreeOpen(':Git status')<cr>
nnoremap <silent> <leader>gd :call IsNerdTreeOpen(':Git diff')<cr>

" fugitive
nnoremap <F9> :execute ":!git push origin master"<cr>
nnoremap <F10> :!git add . && git commit -a -m "
imap <F10> <Esc> :!git add . && git commit -a -m "

cabbrev gs Git status
cabbrev gd Git diff
cabbrev gco Git checkout
cabbrev grh Git reset --hard
cabbrev ga Git add
cabbrev gcm Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
cabbrev gb Git branch
cabbrev gbc Git checkout -b
cabbrev gpu Git push origin master
cabbrev gpoh Git push origin HEAD
cabbrev gpd Git pull origin master
cabbrev gl Git log --pretty --pretty=oneline
cabbrev gcma Git add .<cr>:Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
cabbrev gam Git commit --amend
cabbrev gamend Git commit --amend

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
nnoremap ,s( ciw(<C-r>")<Esc>
nnoremap ,s{ ciw{<C-r>"}<Esc>

" Custom surrounds
" Python docstring
let b:surround_{char2nr('c')} = "\"\"\"\r\"\"\""

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
au FileType go nmap <leader><F12> :GoDecls<cr>
au FileType go nmap <F12> <Plug>(go-def)

cabbrev goi GoImport
cabbrev god GoDrop
cabbrev gof GoFmt
cabbrev got GoTest

" vim-airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
" Correctly display the tab number
let g:airline#extensions#tabline#tab_nr_type = 1

let g:airline#extensions#tabline#show_close_button = 0
let airline#extensions#tabline#show_splits = 0

" Display the tab index above.
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Display the buffer number
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamecollapse = 1
" Don't display full buffer path for files.
let g:airline#extensions#tabline#fnamemod = ':t'
" Don't open up multiple buffer views (they are not tabs)
let g:airline#extensions#tabline#show_buffers = 1

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5

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
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
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
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<cr>

" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1

" Spell check markdown
" autocmd BufRead,BufNewFile *.md setlocal spell
au BufReadPost *.gohtml set syntax=html

" Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<cr>

" Python add trailing space when using #
autocmd BufRead,BufNewFile *.py inoremap # #<space>

" quickly set file type, python, bash, shell
cabbrev setftpy set ft=python
cabbrev setftpython set ft=python
cabbrev setftsh set ft=sh
cabbrev setftbash set ft=sh

" Toggle ale on and off. At was for ale toggle...
cabbrev at ALEToggle<cr>
cabbrev af ALEFix<cr>

"Map ALEFix to F3
au FileType python nmap <silent> <F3> :ALEFix<cr>

" ale
let g:ale_linters = {'go': ['gometalinter', 'gofmt'],}
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_linters = {'python': ['flake8'],}
let g:ale_linters = {'markdown': ['proselint'],}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['python'] = ['remove_trailing_lines', 'isort', 'yapf']

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" Don't fix on every save please.
let g:ale_fix_on_save = 0

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
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<cr>

" toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<cr>

set omnifunc=syntaxcomplete#Complete

" tmux-send keys to send commands to other panes.
au FileType go nmap <F5> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
au FileType go imap <F5> <Esc> :w <cr> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,rg :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
au FileType go nmap <F5><F5> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
au FileType go imap <F5><F5> <Esc> :w <cr> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,gr :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,c :execute ":!tmux send-keys -t 3 C-c"<cr><cr>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 3 clear"<cr><cr>
au FileType python nmap <F5> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<cr><cr>
au FileType python imap <F5> <Esc> :w <cr> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<cr><cr>

nnoremap <silent> ,dkps :execute ":!tmux send-keys -t 2 'docker ps' C-m"<cr><cr>
nnoremap <silent> ,mpl :execute ":!tmux send-keys -t 2 'make post-linux' C-m"<cr><cr>
nnoremap <silent> ,mpr :execute ":!tmux send-keys -t 2 'make post-registrator' C-m"<cr><cr>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 2 'clear' C-m"<cr><cr>
nnoremap <silent> ,pa :execute ":!tmux send-keys -t 2 './apply.sh' C-m"<cr><cr>

" run the current file with rspec
let g:VimuxPromptString = "run: "
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>
map <Leader>vp :VimuxPromptCommand<cr>
map <Leader>vl :VimuxRunLastCommand<cr>
map <Leader>vi :VimuxInspectRunner<cr>
map <Leader>vq :VimuxCloseRunner<cr>
map <Leader>vx :VimuxInterruptRunner<cr>
map <Leader>vz :call VimuxZoomRunner()<cr>

" FZF key bindings
" fzf - check first to make sure we aren't in a nerdtree buffer
"nmap <Leader>F :GFiles<cr>
nnoremap <silent> <expr> <Leader>F (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
"nmap <Leader>f :Files<cr>
nnoremap <silent> <expr> <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
"nmap <Leader>b :Buffers<cr>
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
"nmap <Leader>h :History<cr>
" In insert mode if ctrl+f use blines to search for string in file.
"inoremap <C-f> <Esc><Esc>:BLines!<cr> "This conflicts with other mappings,
"re-think
" ctrl+g opens git commit browser
nnoremap <C-g> :BCommits!<cr>

" ctrl+f brings up fzf
" ctrl-t on a file brings up in new tab
" ctrl-i on a file splits horizontally.
" ctrl-v on a file splits vertically.
nnoremap <C-f> :FZF<cr>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-i': 'split',
			\ 'ctrl-v': 'vsplit' }

" goyo
cabbrev gy Goyo

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

" vim-lexical, we use a custom config so we aren't loading the gigantic
" dictionary file we barely use. Using the default config for some reason
" continues to load in /usr/local/dict/words by default...

command! -nargs=0 CustomLexical call lexical#init({
			\ 'spell': 1,
			\ 'spelllang':  ['en'],
			\ 'dictionary': ['~/.vim/dict/custom.txt'],
			\ 'thesaurus':  ['~/.vim/thesaurus/mthesaur.txt'],
			\ 'spellfile':  ['~/.vim/spell/en.utf-8.add'],
			\ })

let g:lexical#spell_key = '<leader>s'
" map dictionary completion to F11.
inoremap <F11> <C-X><C-K>

" For all files with .md extension load CustomLexical above
au BufReadPost,BufNewFile *.md CustomLexical

" restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" If a file is detected as bash set it to sh
fun! s:DetectNode()
	if getline(1) == '#!/bin/bash'
		set ft=sh
	endif
endfun

" space code appropriately for file type.
autocmd BufNewFile,BufRead * call s:DetectNode()

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

" yaml
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

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

" autoclose for only certain strings/braces
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap ` ``<left>
autocmd FileType python,go,sh inoremap " ""<left>
autocmd FileType python,go,sh inoremap ' ''<left>

autocmd FileType python call SemshiCustomHighlights()

" Quickly copy a file in the buffer
nnoremap <leader>c :call CopyCurrentFile()<cr>
"cabbrev cp call CopyCurrentFile()<cr>

" Experiments with nvim terminal
if has('nvim')
	" map esc back to something sane in terminal mode.
	tnoremap <Esc> <C-\><C-n>
	" once you map esc you can't send esc key to the underlying program in the
	" buffer. Map Alt+[ to send esc to the underlying program.
	tnoremap <A-[> <Esc>
	" alt+[h,j,k,l] for quickly switching between splits with terminals.
	tnoremap <A-h> <c-\><c-n><c-w>h
	tnoremap <A-j> <c-\><c-n><c-w>j
	tnoremap <A-k> <c-\><c-n><c-w>k
	tnoremap <A-l> <c-\><c-n><c-w>l
endif

" leader l to quickly switch buffers.
nnoremap <leader>l :ls<cr>:b<space>

" macdictionary support
cabbrev dw MacDictWord<cr>
nnoremap <C-d> :MacDictWord<cr>

cabbrev luw MacDictQuery<cr>
cabbrev lu MacDictQuery<cr>

cabbrev gc LanguageToolCheck<cr>
cabbrev gq LanguageToolClear<cr>

let g:vim_mac_dictionary_use_app = 1

" Wordy
cabbrev ww Wordy weak
cabbrev wp Wordy problematic
cabbrev wr Wordy redundant
cabbrev wadj Wordy adjectives
cabbrev wadv Wordy adverbs
cabbrev nw NoWordy

" 'cd' towards the dir in which the current file is edited
" but only change the path for the current window
map <leader>cd :lcd %:h<cr>
" Open files located in the same dir in with the current file is edited
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <cr>

" Experimenting with tabs
" tp "tab previous in normal mode"
nmap tp :tabp<cr>
" tn "tab next in normal mode"
nmap tn :tabn<cr>
" control-t for new tab, control-w to close, similar to browser
nmap <C-t> :tabnew<cr>
nmap <C-w> :tabclose<cr>

" Aliases for jumping around quickly
cabbrev cdh cd $HOME<cr>
cabbrev cdgit cd $HOME/git<cr>
cabbrev cddot cd $HOME/.dotfiles<cr>
cabbrev cdconf cdconf $HOME/.config<cr>
" Create a directory with current date
cabbrev cdcb cd $HOME/git/cb<cr>


nnoremap mkd :call CreateDailyFolder()<cr>
cabbrev Cd :call fzf#run({'source':  'find . \( -name ".git" -o -name ".vim" -o -name "Library" \) -prune  -o -type d -print','sink': 'cd'})

" Hugo make public
cabbrev mp :!make public<cr><cr>

" Shell command formatter, call this when editing ugly shell one liners with ctr-g
command! -range Fmtsh <line1>!format_shell_cmd.py

" vim-indentguides
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_firstlevel = 1
" Ignore indent these file types please
let g:indentguides_ignorelist = ['text', 'markdown', 'tex', 'pandoc', 'nerdtree', 'vim', 'dockerfile', 'json']
let g:indentguides_conceal_color = 'ctermfg=238 ctermbg=234'
"Allow us to toggle indentlines on off
cabbrev it IndentGuidesToggle

" gitgutter
set updatetime=100

"Delete everything in the file and start over, good for scratch testing.
nnoremap <leader>d :1,$d<cr>
inoremap <leader>d <esc>:1,$d<cr>

nnoremap <silent> <Right> :bn<cr>
nnoremap <silent> <Left> :bp<cr>
