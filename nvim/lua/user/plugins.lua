local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer: close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd( { 'BufWritePost' }, {
  pattern = 'plugins.lua',
  group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
  callback = function(args) vim.cmd('source ' .. args.file .. ' | PackerSync') end,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"          -- Have packer manage itself

  -- use 'sainnhe/everforest'
  -- use 'Shatur/neovim-ayu'
  -- https://github.com/EdenEast/nightfox.nvim
  use { "folke/tokyonight.nvim" }
  use { "EdenEast/nightfox.nvim", lazy = true }
  use { "rose-pine/neovim", lazy = true }
  use { "catppuccin/nvim", lazy = true, as = "catppuccin" }

  use 'onsails/lspkind.nvim'

  use "nvim-lua/popup.nvim"             -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"           -- Useful lua functions used by lots of plugins

  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-treesitter/nvim-treesitter',
    }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- autocompletion
      'hrsh7th/nvim-cmp',
      -- 'hrsh7th/nvim-cmp-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      {
        'zbirenbaum/copilot-cmp',
        config = function()
          require('copilot_cmp').setup()
        end,
      },

      -- snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  }

  use 'tpope/vim-commentary'

  use 'tpope/vim-surround'

  use 'tpope/vim-eunuch'

  use 'tpope/vim-unimpaired'

  use 'tpope/vim-sleuth'

  use 'tpope/vim-repeat'

  use 'sheerun/vim-polyglot'

  use 'christoomey/vim-tmux-navigator'

  use 'nelstrom/vim-visual-star-search'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'nvim-tree/nvim-web-devicons', opt = true},
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
  }

  use 'nvim-treesitter/playground'

  use 'theprimeagen/harpoon'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  use {
    'vim-test/vim-test',
    requires = {
      'tpope/vim-dispatch',
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
  }

  use { "johmsalas/text-case.nvim",
    config = function()
      require('textcase').setup {}
    end
  }

  use { 'phpactor/phpactor',
    ft = 'php',
    run = 'composer install --no-dev --optimize-autoloader',
    config = function()
      vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
    end,
  }

  use { 'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          php = { "php_cs_fixer" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = false,
        },
        formatters = {
          php_cs_fixer = {
            command = 'vendor/bin/php-cs-fixer',
          },
        },
      })
    end,
  }

  -- use 'dense-analysis/ale'

  -- use 'github/copilot.vim'
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "VimEnter", "InsertEnter" },
    config = function()
      require('copilot').setup({
        cmp = {
          enabled = true,
          method = 'getCompletionsCycling',
        },
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          xml = false,
          md = false,
        },
      })
    end,
  }

  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
  }

  -- use 'Olical/conjure'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
