
-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end



vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],

  false
)



local packer = require 'packer'
local use = require('packer').use

local function fn_config(name)
  return require(string.format('plugins.%s', name))
end



packer.startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'tpope/vim-fugitive' -- Git commands in nvim

  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'lukas-reineke/cmp-rg'

  -- use 'simrat39/rust-tools.nvim'

  --themes
  use 'sainnhe/everforest'
  use 'rmehri01/onenord.nvim'

  use {
    'EdenEast/nightfox.nvim',
    config = fn_config 'nightfox'
  }

  use {
    'blackCauldron7/surround.nvim',
    config = fn_config 'surround'
  }

  use {
    'folke/todo-comments.nvim',
    config = fn_config 'todo-comments'
  }

  use {
    'nacro90/numb.nvim',
    config = fn_config 'numb'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = fn_config 'lualine',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'sheerun/vim-polyglot'

  use 'nvim-telescope/telescope-file-browser.nvim'

  use {
    'filipdutescu/renamer.nvim',
    config = function()
      require('renamer').setup({})
    end,
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Add indentation guides even on blank lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = fn_config 'indentline'
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter').config()
    end
  }

  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    config = function()
      require('plugins.lsp-config').config()
    end
  }

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use 'L3MON4D3/LuaSnip'

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp').config()
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-tabnine',
      'L3MON4D3/LuaSnip'
    }
  }

  use 'hrsh7th/cmp-nvim-lsp'

  use 'ggandor/lightspeed.nvim'

  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter'
  }

  use 'kyazdani42/nvim-web-devicons'

  use 'eddyekofo94/gruvbox-flat.nvim'

  use 'p00f/nvim-ts-rainbow'

  use 'mfussenegger/nvim-dap'

  use 'onsails/lspkind-nvim'

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope').config()
    end,
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    config = fn_config 'gitsigns',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-path'

  use {
    'jdhao/better-escape.vim',
    event = 'InsertEnter',
    config = fn_config 'better-escape'
  }

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.nvim-tree').config()
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.nvim-autopairs').config()
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins.null-ls').config()
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig'
    }
  }
end)

