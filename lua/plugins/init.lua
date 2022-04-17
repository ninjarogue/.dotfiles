
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



  -- nvim-lsp
  use {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    config = function()
      require('plugins.lsp-config').config()
    end
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'nvim-treesitter/nvim-treesitter-textobjects'   -- Additional textobjects for treesitter



  -- snippets
  use 'L3MON4D3/LuaSnip'



  -- themes
  use {
    'marko-cerovac/material.nvim',
    config = function()
      require('material').setup {
        contrast = {
          sidebars = true,
          cursor_line = true,
        },

        italics = {
          comments = true,
          functions = true,
        },

        contrast_filetypes = {
          "terminal",
          "packer",
          "qf",
        }
      }
    end,
  }

  -- use {
  --   'EdenEast/nightfox.nvim',
  --   config = fn_config 'nightfox'
  -- }

  use 'eddyekofo94/gruvbox-flat.nvim'


  -- git
  use {
    'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
    config = fn_config 'gitsigns',
    requires = { 'nvim-lua/plenary.nvim' }
  }



  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = fn_config 'telescope',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'cljoly/telescope-repo.nvim'
  use 'jvgrootveld/telescope-zoxide'



  -- cmp auto-completion
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

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'lukas-reineke/cmp-rg'



  -- the rest
  use {
    'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code using a fast incremental parsing library
    config = function()
      require('plugins.treesitter').config()
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

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.nvim-autopairs').config()
    end
  }

  use {
    'jdhao/better-escape.vim',
    event = 'InsertEnter',
    config = fn_config 'better-escape'
  }

  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter'
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

  use {
    'filipdutescu/renamer.nvim',
    config = function()
      require('renamer').setup({})
    end,
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  use {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    config = fn_config 'indentline'
  }

  use {
    'blackCauldron7/surround.nvim',
    config = fn_config 'surround'
  }

  use {
    'mizlan/iswap.nvim', -- swap parameters
    config = fn_config 'iswap',
  }

  use {
    "SmiteshP/nvim-gps",
    config = fn_config 'gps',
    requires = "nvim-treesitter/nvim-treesitter",
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"
      },
      config = fn_config 'neo-tree',
  }
  use 'MunifTanjim/nui.nvim'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-repeat'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'p00f/nvim-ts-rainbow'
  use 'kyazdani42/nvim-web-devicons'
  use 'onsails/lspkind-nvim'
  use 'ggandor/lightspeed.nvim'
end)

