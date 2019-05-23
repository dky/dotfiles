set ruler
set nocompatible
set hidden
call plug#begin('~/.vim/plugged')

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	"Go
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
	"Python
	Plug 'zchee/deoplete-jedi'
	"JS support
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
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-arpeggio'
Plug 'benmills/vimux'
Plug 'rodjek/vim-puppet'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'takac/vim-hardtime'
Plug 'roxma/vim-tmux-clipboard'
Plug 'majutsushi/tagbar'
"writing plugins
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'
Plug 'dky/wordnet.vim'
Plug 'rhysd/vim-grammarous'
"Override colorscheme defaults, I needed this because the pmenu popup was too
"dark and wanted to use a lighter popup color
"Customizations are stored in ~/.vim/after/colors/molokai.vim
"https://stackoverflow.com/questions/10454038/setting-vim-omnicompletion-colors-pmenu-in-vimrc-not-working
Plug 'dky/vim-aftercolors'

call plug#end()

"Disable backups and swap
set noswapfile
set nobackup

set number
set relativenumber
"Tab use 3 spaces
set tabstop=3
set shiftwidth=3
"autocompletion
set wildmode=list:longest
"set autoindent
set smartindent
"split below
set splitbelow
set hlsearch
set incsearch
set foldenable
"enable paste mode for pasted code
set pastetoggle=<F2>
"Allow backspacing in insert mode
set backspace=indent,eol,start
set visualbell           "don't beep
set noerrorbells         "don't beep
"renamp esc to jk
imap jk <Esc>
"comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>
"no arrow keys
nmap <left> <nop>
nmap <right> <nop>

au FileType go nmap <F8> :w <CR> :echo system('go run "' . expand('%') . '"')<CR>
au FileType go imap <F8> <Esc> :w <CR> :echo system('go run "' . expand('%') . '"')<CR>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType python imap <F8> <Esc> :w <CR> :echo system('python3 "' . expand('%') . '"')<CR>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<CR>
au FileType javascript imap <F8> <Esc> :w <CR> :echo system('node "' . expand('%') . '"')<CR>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<CR>
au FileType c nmap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au FileType c imap <F8> <Esc> :w <CR> :!gcc % -o %< && ./%< <CR>

nmap <F4> :set number! <bar> :set relativenumber! <bar> :set list! <bar> :GitGutterSignsDisable<CR>
"nerdtree
nmap ,nt :NERDTreeToggle<CR>
nmap <F1> :NERDTreeToggle<CR>
"map f1 vim help to esc
imap <F1> <Esc>

"tagbar toggle
"requires exuberant-ctags, 
"go - github.com/jstemmer/gotags
nmap ,tb :TagbarToggle<CR>
nmap <Leader><F1> :TagbarToggle<CR>

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,go.mod,go.sum
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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
nmap ,ev :tabedit $HOME/.vimrc<CR>
nmap ,ch :CheckHealth<CR>
nmap ,up :UpdateRemotePlugins<CR>
"reload vim quickly
nmap ,rv :source $MYVIMRC<CR>
"map space rather than colon
nmap <space> :
"Shortcut for vundle
nmap ,bi :PlugInstall<CR>
nmap ,gib :GoInstallBinaries<CR>
"Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

"nmap <c-o> o
"nmap <c-k> O
"fugitive
nnoremap ,gs :Gstatus<CR>
nnoremap <F11> :Gstatus<CR>
nnoremap <silent> ,gpu :execute ":!git push origin master"<CR><CR>
nnoremap <F9> :execute ":!git push origin master"<CR>
nnoremap ,gma :!git add . && git cm "
nnoremap <F10> :!git add . && git cm "
imap <F10> <Esc> :!git add . && git cm "
nnoremap ,gpd :Git pull origin master<CR>

"https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
"Jump to next bracket/empty line
"inoremap <C-j> <C-o>}

"surround markdown emphasis
nnoremap ,yse ciw**<C-r>"**<Esc>
nnoremap ,ysq ciw"<C-r>""<Esc>
nnoremap ,yst ciw`<C-r>"`<Esc>
nnoremap ,ysb ciw[<C-r>"]<Esc>

"vim-go
"Don't show warnings if we are not using nvim or > 7.4.1099, thanks RedHat...
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
"Shorter aliases for vim-go plugin
au FileType go nmap <leader>gt :GoDeclsDir
au FileType go nmap <F12> <Plug>(go-def)

cabbrev gi GoImport
cabbrev gd GoDrop
cabbrev gf GoFmt
cabbrev gt GoTest
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
"neosnippets
"reload snippets
nnoremap ,rs :call neosnippet#variables#set_snippets({})<cr>

let g:neosnippet#snippets_directory='~/.dotfiles/.snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<CR>
"plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1
"Spell checking on markdown
"autocmd BufRead,BufNewFile *.md setlocal spell
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
let g:ale_linters = {'go': ['gometalinter', 'gofmt'],}
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
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 0

"Clangformat C code
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

"map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

set omnifunc=syntaxcomplete#Complete

"Reload go for now. Until I read about other methods, this will have to do.
au FileType go nmap <F5> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
au FileType go imap <F5> <Esc> :w <CR> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,rg :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<CR><CR>
au FileType go nmap <leader><F5> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
au FileType go imap <leader><F5> <Esc> :w <CR> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,gr :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<CR><CR>
nnoremap <silent> ,c :execute ":!tmux send-keys -t 3 C-c"<CR><CR>
nnoremap <silent> ,dkps :execute ":!tmux send-keys -t 2 'docker ps' C-m"<CR><CR>
nnoremap <silent> ,mpl :execute ":!tmux send-keys -t 2 'make post-linux' C-m"<CR><CR>
nnoremap <silent> ,mpr :execute ":!tmux send-keys -t 2 'make post-registrator' C-m"<CR><CR>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 2 'clear' C-m"<CR><CR>
nnoremap <silent> ,pa :execute ":!tmux send-keys -t 2 './apply.sh' C-m"<CR><CR>

"Run the current file with rspec
let g:VimuxPromptString = ":"
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

"fzf
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

cabbrev gy Goyo

"This if block is required because I often jump on Redhat 7.x...
"deoplete.nvim recommend
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

"tern
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
"deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"deoplete tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"hardmode vim
"let g:hardtime_default_on = 1
"let g:hardtime_showmsg = 1
"
"create dir that does not exist on save
"https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup createDirIfNoneExists
	autocmd!
	autocmd BufWritePre *
				\ if !isdirectory(expand("<afile>:p:h")) |
				\ call mkdir(expand("<afile>:p:h"), "p") |
				\ endif
augroup END
"save everytime leave insert mode + also check for existence of file prior
"This is a mix of
"command autocmd InsertLeave * write and this post
"https://stackoverflow.com/questions/10394707/create-file-inside-new-directory-in-vim-in-one-step
augroup insertLeaveWrite
	autocmd!
	autocmd InsertLeave * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
	function! s:auto_mkdir(dir, force)
		if !isdirectory(a:dir)
			call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
			write
		else
			autocmd InsertLeave * write
		endif
	endfunction
augroup END

set cursorline
"default colors for CursorLine
"https://jonasjacek.github.io/colors
hi CursorLine ctermbg=236
"hi Cursor guibg=#A6E22E;
"change Color when entering Insert Mode
"autocmd InsertEnter * hi CursorLine ctermbg=237
autocmd InsertEnter * hi CursorLine ctermbg=24
"autocmd InsertEnter * hi Cursor guibg=#00AAFF;
"revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine ctermbg=236
"autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;" This 
hi LineNr ctermbg=236 ctermfg=246
hi Visual ctermbg=190 ctermfg=16
hi Comment ctermfg=43
"search colors
hi Search cterm=NONE ctermfg=white ctermbg=238

"vim-logbook shortcuts
noremap ,lb :Lb<cr>
noremap ,ts :Ts<cr>

"Everything here deals with spelling and dictionary support
"vim underline spelling errors don't color them.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=yellow
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

"Configure vim-lexical plugin
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

"vim-grammarous
"nmap <F8> :GrammarousCheck<CR>
au FileType markdown nmap <F8> :GrammarousCheck<CR>
hi GrammarousError ctermfg=white ctermbg=red
hi GrammarousInfoError ctermfg=white ctermbg=blue
hi GrammarousInfoSection ctermfg=white ctermbg=blue
hi GrammarousInfoHelp ctermfg=white ctermbg=blue

"proselint
call ale#linter#Define('text', {
\   'name': 'proselint',
\   'executable': 'proselint',
\   'command': 'proselint %t',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})

"restore me to the last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"wordnet/dictionary lookup for F7 only on markdown files please.
au FileType markdown nmap <F7> :call wordnet#overviews("<C-r>=expand("<cword>")<CR>")<CR>

"Code Spacing
"python spacing
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 | 
    \ set textwidth=79 |
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix

"go spacing
au BufNewFile,BufRead *.go
    \ set noexpandtab |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

"js, html, css
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.md
    \ set noautoindent |
    \ set nocindent |
    \ set nosmartindent |
    \ set indentexpr=


