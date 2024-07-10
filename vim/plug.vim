if has('nvim')
	" Run pip3 install --user pynvim outside of vim then: :UpdateRemotePlugins
	Plug 'neovim/nvim-lspconfig'
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
	Plug 'folke/trouble.nvim'
	" Required for vale
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'Pocco81/auto-save.nvim'
	" helm yaml
	Plug 'towolf/vim-helm'
	"Check if ENABLE_COPILOT env is set. If it is load the co-pilot plugin
	if !empty($ENABLE_COPILOT)
		Plug 'github/copilot.vim'
	endif
else
endif

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
Plug 'tanvirtin/monokai.nvim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'benmills/vimux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-sneak'
Plug 'dky/vim-aftercolors'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdcommenter'
