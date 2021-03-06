
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

local function get_conf(name)
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
    'EdenEast/nightfox.nvim',
    config = get_conf 'nightfox'
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
    config = get_conf 'gitsigns',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = get_conf 'telescope',
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
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code using a fast incremental parsing library
    config = function()
      require('plugins.treesitter').config()
    end
  }

  use {
    'folke/lsp-trouble.nvim',
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
    config = get_conf 'nvim-autopairs'
  }

  use {
    'jdhao/better-escape.vim',
    opt = true,
    event = 'InsertEnter',
    config = get_conf 'better-escape'
  }

  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter'
  }

  use {
    'folke/todo-comments.nvim',
    config = get_conf 'todo-comments'
  }

  use {
    'nacro90/numb.nvim',
    config = get_conf 'numb'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = get_conf 'lualine',
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
    config = get_conf 'indentline'
  }

  use {
    'blackCauldron7/surround.nvim',
    config = get_conf 'surround'
  }

  use {
    'mizlan/iswap.nvim', -- swap parameters
    config = get_conf 'iswap',
  }

  use {
    "SmiteshP/nvim-gps",
    config = get_conf 'gps',
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
      config = get_conf 'neo-tree',
  }

  use {
  'phaazon/hop.nvim',
  branch = 'v1', -- optional but strongly recommended
  config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end,
  }

  use 'MunifTanjim/nui.nvim'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'p00f/nvim-ts-rainbow'
  use 'kyazdani42/nvim-web-devicons'
  use 'onsails/lspkind-nvim'
  -- use 'ggandor/lightspeed.nvim'
end)

