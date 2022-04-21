Plug 'jesseleite/vim-sourcery'

" Better navigation between vim windows and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Treesitter - syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Syntax analysis and fixing
Plug 'dense-analysis/ale'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'

" Better comments
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

" Telescope fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'

" Themes
Plug 'michaeldyrynda/carbon'
Plug 'NLKNguyen/papercolor-theme'

" Status line
" Plug 'vim-airline/vim-airline'

" Status line themes
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Testing
Plug 'voldikss/vim-floaterm'
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'

" PHP
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}

" Neovim LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
