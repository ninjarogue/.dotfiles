lvim.plugins = {
  { 'folke/tokyonight.nvim' },

  { 'eddyekofo94/gruvbox-flat.nvim' },

  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
  },

  { 'tpope/vim-fugitive' },

  { 'tpope/vim-surround' },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('user.lsp-signature').config()
    end,
  },

  {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup{
        error = '#db4b4b',
        warning = '#e0af68',
        information = '#0db9d7',
        hint = '#10b981',
      }
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    event='BufReadPre'
  },

  { 'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function()
      require 'user.blankline'
    end,
  },

  {
    'unblevable/quick-scope',
    config = function()
      require 'user.quickscope'
    end,
  },

  {
    'andymass/vim-matchup',
    event = 'CursorMoved',
    config = function()
      require 'user.matchup'
    end,
  },

  {
    'nacro90/numb.nvim',
    event = 'BufRead',
    config = function()
      require('user.numb').config()
    end,
  },

  {
    'tzachar/cmp-tabnine',
    config = function()
      local tabnine = require 'cmp_tabnine.config'
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true
      }
    end,

    run = './install.sh',
    requires = 'hrsh7th/nvim-cmp',
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = { 'SymbolsOutline' },
  },

  {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
  },

  {
    'akinsho/flutter-tools.nvim',
    cmd = { 'FlutterRun' },
    requires = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('flutter-tools').setup{}
    end
  },

  {
    'jdhao/better-escape.vim',
    event = 'InsertEnter'
  },

  { 'ggandor/lightspeed.nvim' },

  {
    'nvim-telescope/telescope-media-files.nvim',
    config = function()
      require('telescope').load_extension('media_files')
    end
  }
}

