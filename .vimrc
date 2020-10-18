call plug#begin('~/.vim/plugged')

" nvim view/cache location
" $HOME/.local/share/nvim/view

if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	" Go
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make', 'for': 'go' }
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

	" Python
	" pip3 install --user pynvim
	Plug 'zchee/deoplete-jedi', { 'for': 'python' }
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }
	Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

	" JS
	Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern', 'for': 'javascript' }
else
endif

Plug 'vim-test/vim-test'
Plug 'deoplete-plugins/deoplete-dictionary'
" Markdown
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Indentguides
Plug 'thaerkh/vim-indentguides', { 'for': ['go', 'python', 'neosnippet', 'sh', 'yaml', 'tf'] }

Plug 'voldikss/vim-floaterm'
Plug 'kassio/neoterm'

Plug 'hashivim/vim-terraform'
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'jamesroutley/vim-logbook'
Plug 'metakirby5/codi.vim'
Plug 'rhysd/vim-clang-format'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kana/vim-arpeggio'
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'roxma/vim-tmux-clipboard'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
" Override colorscheme defaults, I needed this because the pmenu popup was too
" dark and wanted to use a lighter popup color
" Customizations are stored in ~/.vim/after/colors/molokai.vim
" https://stackoverflow.com/questions/10454038/setting-vim-omnicompletion-colors-pmenu-in-vimrc-not-working
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'luochen1990/rainbow'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1

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

let g:codi#width = winwidth(winnr()) / 2
let g:codi#rightalign = 0

"Disable semshi error sign and just let flake8 handle it.
let g:semshi#error_sign = v:false

" nerdtree
" Open nerdtree on startup.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore = ['\.pyc$', '\.go.mod$', '\.DS_Store$', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" refresh nerdtree
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

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
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
" Autosave broke snippet expansion
" https://github.com/Shougo/neosnippet.vim/issues/331
" :help g:neosnippet#enable_auto_clear_markers
let g:neosnippet#enable_auto_clear_markers = 0
" Get rid of preview popup
set completeopt-=preview

" ale
let g:ale_linters = {'go': ['gometalinter', 'gofmt'],}
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_linters = {'python': ['flake8', 'pylint'],}
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

set omnifunc=syntaxcomplete#Complete

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-i': 'split',
			\ 'ctrl-v': 'vsplit' }

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

" spelling and dictionary support
" vim underline spelling errors don't color them.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=yellow
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

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

" neosnippets
" You can :set noet|%retab! in your .snip file to replace all spaces with hard tabs, that way the extra indentation is fixed!
" https://github.com/Shougo/neosnippet.vim/issues/445
au BufNewFile,BufRead *.snip
			\ set noet|%retab!

" golang
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

" markdown
au BufNewFile,BufRead *.md
			\ set noautoindent |
			\ set nocindent |
			\ set nosmartindent |
			\ set indentexpr=

" yaml
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" .gohtml files should be html
au BufReadPost *.gohtml set syntax=html

" vim sneak
let g:sneak#label = 1

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

" vim AutoSave
let g:auto_save = 1  " enable AutoSave on Vim startup

" mac dictionary
let g:vim_mac_dictionary_use_app = 1

" Shell command formatter, call this when editing ugly shell one liners with ctr-g
command! -range Fmtsh <line1>!format_shell_cmd.py

" vim-indentguides
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_firstlevel = 1
let g:indentguides_conceal_color = 'ctermfg=238 ctermbg=234'

" gitgutter
set updatetime=100

" terraform-vim plugin
"let g:terraform_fmt_on_save=1
let g:terraform_align=1

" When opening markdown files call WordProcessorMode
au BufNewFile,BufRead *.md call WordProcessorMode()

" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1

" neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

" floatterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.9
let g:floaterm_height=0.4
let g:floaterm_autoclose=1
let g:floaterm_position='bottom'
let g:floaterm_title='ft: $1/$2'
hi FloatermBorder ctermfg=cyan

" Load in cabbrevs
if !empty(glob("~/.dotfiles/.vim_cabbrev.vim"))
	source ~/.dotfiles/.vim_cabbrev.vim
endif

" Load in maps
if !empty(glob("~/.dotfiles/.vim_maps.vim"))
	source ~/.dotfiles/.vim_maps.vim
endif

" Load in funcs
if !empty(glob("~/.dotfiles/.vim_functions.vim"))
	source ~/.dotfiles/.vim_functions.vim
endif
