

-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end





local set = vim.opt





set.relativenumber = true
set.joinspaces = false
set.timeoutlen = 500
set.completeopt = 'menu,menuone,noselect' -- Set completeopt to have a better completion experience
set.inccommand = 'nosplit' --Incremental live completion (note: this is now a default on master)
set.showmode = false
set.hlsearch = true --Set highlight on search
vim.api.swapfile = false
vim.wo.number = true --Make line numbers default
set.autoindent = true
set.smartindent = true -- make indenting smarter again
set.wildignore = '*/node_modules/**'
set.hidden = true --Do not save when switching buffers (note: this is now a default on master)
set.wrap = false
set.splitright = true
set.splitbelow = true
set.cursorline = false
set.mouse = 'a' --Enable mouse mode
set.breakindent = true --Enable break indent
set.undofile = true --Save undo history
set.ignorecase = true --Case insensitive searching UNLESS /C or capital in search
set.smartcase = true
set.updatetime = 250 --Decrease update time
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
set.fileencoding = 'utf-8' -- the encoding written to a file
vim.wo.signcolumn = 'yes'
set.termguicolors = true --Set colorscheme (order is important here)
vim.g.gruvbox_flat_style = 'dark'
vim.g.gruvbox_dark_sidebar = true
vim.nvim_tui_enable_true_color = true
vim.g.gruvbox_sidebars = { "qf", "terminal", "packer" }
vim.g.gruvbox_colors = {
  fg = "#D4D298",
}

vim.cmd [[colorscheme gruvbox-flat]]

--Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })



vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],

  false
)

vim.api.nvim_exec(
  [[
    augroup Random
      autocmd!
      autocmd BufWritePre * %s/\s\+$//e
    augroup end
  ]],

  false
)

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],

  false
)



local packer = require 'packer'
local use = require('packer').use

packer.startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'tpope/vim-fugitive' -- Git commands in nvim

  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  use 'itchyny/lightline.vim' -- Fancier statusline

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'

  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin

  use 'hrsh7th/cmp-nvim-lsp'

  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'ggandor/lightspeed.nvim'

  use 'windwp/nvim-ts-autotag'

  use 'kyazdani42/nvim-web-devicons'

  use 'eddyekofo94/gruvbox-flat.nvim'

  -- use 'gruvbox-community/gruvbox'

  use 'p00f/nvim-ts-rainbow'

  use 'tpope/vim-surround'

  use 'mfussenegger/nvim-dap'

  use 'puremourning/vimspector'

  use 'onsails/lspkind-nvim'

  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-path'

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'ninjarogue.nvim-tree'
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{
        disabled_filetype = { 'TelescopePrompt' }
      }
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end
  }

  use {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        mapping = { 'kj', 'jj', 'kk' }
      }
    end
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.config{
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file(".eslintrc.json")
            end,
          }),
        }
      }
      require('lspconfig')['null-ls'].setup{}
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig'
    }
  }
end)




--Set statusbar
vim.g.lightline = {
  colorscheme = 'gruvbox-flat',

  active = {
    left = {
      { 'mode', 'paste' },
      {
        'gitbranch',
        'readonly',
        'filename',
        'modified'
      }
    }
  },

  component_function = { gitbranch = 'fugitive#head' },
}




-- Hide lsp diagnostics virtual text
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false }
)




--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false





require('ninjarogue.mappings')
require('ninjarogue.gitsigns')
require('ninjarogue.telescope')
require('ninjarogue.treesitter')
require('ninjarogue.lsp')
require('ninjarogue.cmp')

