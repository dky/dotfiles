if has('nvim')
	" Do this at the OS level, then Run :UpdateRemotePlugins
	" pip3 install --user pynvim
	Plug 'neovim/nvim-lspconfig'
"	Plug 'hrsh7th/nvim-compe'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'uga-rosa/cmp-dictionary'

	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
	Plug 'sbdchd/neoformat'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'windwp/nvim-autopairs'
	" Git gutter
	Plug 'nvim-lua/plenary.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	" Status line + web devicons
	Plug 'NTBBloodbath/galaxyline.nvim',
	Plug 'kyazdani42/nvim-web-devicons' " lua
	"Plug 'tmhedberg/SimpylFold' "Python folding
	Plug 'folke/trouble.nvim'
else
endif

" Python text objects
Plug 'jeetsukumaran/vim-pythonsense'

" Jinja2 for salt
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'vim-test/vim-test'
Plug 'hashivim/vim-terraform'
"
" Writing plugins
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Tig - Bclose plugin is required to close tig cleanly
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
"
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'fatih/molokai'
Plug 'tanvirtin/monokai.nvim'
Plug 'fatih/vim-go'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'jamesroutley/vim-logbook'
Plug 'metakirby5/codi.vim'
Plug 'benmills/vimux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-sneak'
Plug 'Pocco81/AutoSave.nvim'
Plug 'dky/vim-aftercolors'

Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'
