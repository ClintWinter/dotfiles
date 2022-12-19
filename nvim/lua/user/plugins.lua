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
  -- My plugins here
  use "wbthomason/packer.nvim"          -- Have packer manage itself

  use 'folke/tokyonight.nvim'           -- theme
  use 'onsails/lspkind.nvim'            -- kind icons

  use "nvim-lua/popup.nvim"             -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"           -- Useful lua functions used by lots of plugins

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      {'nvim-treesitter/nvim-treesitter'},
    }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP
      {'neovim/nvim-lspconfig'},           -- enable LSP
      {'williamboman/mason.nvim'},         -- LSP package manager
      {'williamboman/mason-lspconfig.nvim'},

      -- autocompletion
      {'hrsh7th/nvim-cmp'},                -- The completion plugin
      {'hrsh7th/cmp-buffer'},              -- buffer completions
      {'hrsh7th/cmp-path'},                -- path completions
      {'hrsh7th/cmp-cmdline'},             -- cmdline completions
      {'saadparwaiz1/cmp_luasnip'},        -- snippet completions
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- snippets
      {'L3MON4D3/LuaSnip'},                -- snippet engine
      {'rafamadriz/friendly-snippets'},    -- a set of snippets
    }
  }

  use 'tpope/vim-commentary'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons', opt = true},
    }
  }

  use {
      'nvim-treesitter/nvim-treesitter', 
      {run = ':TSUpdate'},
  }
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
