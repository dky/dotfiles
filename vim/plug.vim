if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	" pip3 install --user pynvim
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }
else
endif

Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-test/vim-test'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'b4b4r07/vim-hcl'
Plug 'hashivim/vim-terraform'
" Indenting guides
Plug 'thaerkh/vim-indentguides', { 'for': ['go', 'python', 'neosnippet', 'sh', 'yaml', 'tf', 'html', 'js', 'vue'] }
"
" Writing plugins
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"
Plug 'voldikss/vim-floaterm'
Plug 'kassio/neoterm'
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
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'jamesroutley/vim-logbook'
Plug 'metakirby5/codi.vim'
Plug 'rhysd/vim-clang-format'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kana/vim-arpeggio'
Plug 'benmills/vimux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
"Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug '907th/vim-auto-save'
Plug 'fatih/vim-hclfmt'
Plug 'dky/vim-aftercolors'
Plug 'luochen1990/rainbow'
"Ctags pre-requisite
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
"Ranger
Plug 'kevinhwang91/rnvimr'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
