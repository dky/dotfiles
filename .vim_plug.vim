if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	" pip3 install --user pynvim
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
endif

Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-test/vim-test'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'thaerkh/vim-indentguides', { 'for': ['go', 'python', 'neosnippet', 'sh', 'yaml', 'tf', 'json', 'html', 'js'] }
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
"Plug 'w0rp/ale'
Plug 'roxma/vim-tmux-clipboard'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
Plug 'dky/vim-aftercolors'
Plug '907th/vim-auto-save'
Plug 'luochen1990/rainbow'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'fatih/vim-hclfmt'
Plug 'b4b4r07/vim-hcl'
"Ctags pre-requisite
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plug 'ludovicchabant/vim-gutentags'
