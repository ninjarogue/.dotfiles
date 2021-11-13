-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local set = vim.opt

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
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

  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  use 'itchyny/lightline.vim' -- Fancier statusline

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

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

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'user.nvim-tree'
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
      }
    end,
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

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup{}
    end
  }

  use {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        mapping = { 'kj', 'jj', 'kk' }
      }
    end,
  }

  use 'hrsh7th/nvim-cmp' --completion

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use { 'p00f/nvim-ts-rainbow' }

  use { 'tpope/vim-surround' }

  use { 'mfussenegger/nvim-dap' }
end)





set.relativenumber = true
set.joinspaces = false
set.linespace = 3
set.timeoutlen = 300
-- Set completeopt to have a better completion experience
set.completeopt = 'menuone,noselect'
--Incremental live completion (note: this is now a default on master)
set.inccommand = 'nosplit'
set.showmode = false
--Set highlight on search
set.hlsearch = true
vim.api.swapfile = false
--Make line numbers default
vim.wo.number = true

set.autoindent = true
set.smartindent = true -- make indenting smarter again
set.wildignore = '*/node_modules/**'

--Do not save when switching buffers (note: this is now a default on master)
set.hidden = true
set.wrap = false
set.splitright = true
set.splitbelow = true
set.cursorline = false
--Enable mouse mode
set.mouse = 'a'
--Enable break indent
set.breakindent = true
--Save undo history
set.undofile = true
--Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
--Decrease update time
set.updatetime = 250
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
set.fileencoding = 'utf-8' -- the encoding written to a file
vim.wo.signcolumn = 'yes'
--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox-flat]]





--Set statusbar
vim.g.lightline = {
  colorscheme = 'wombat',

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





--Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })





--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<C-o>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kk', '<C-o>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'J', 'mzyyp`z', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'mzyyP`z', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<cr>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<cr>==', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '$', 'g_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '0', '_', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'q', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', 'q', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>j', 'mzJ`z', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', 'yg_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':vs<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zzzv', { noremap = true, silent = true })

-- Copy from clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>P', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>be', ':BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>', { noremap = true, silent = true })

vim.cmd [[ nnoremap <silent> H :BufferLineCyclePrev<CR> ]]
vim.cmd [[ nnoremap <silent> L :BufferLineCycleNext<CR> ]]
vim.cmd [[ nnoremap <silent> <leader>] :BufferLineMoveNext<CR> ]]
vim.cmd [[ nnoremap <silent> <leader>[ :BufferLineMovePrev<CR> ]]

vim.cmd [[nnoremap oo mzo<Esc>`z]]
vim.cmd [[nnoremap OO mzO<Esc>`z]]
vim.cmd [[nnoremap <leader>nv :e ~/.config/nvim/init.lua<CR>]]
vim.cmd [[nnoremap <Left>  :vertical resize +5<CR>]]
vim.cmd [[nnoremap <Right> :vertical resize -5<CR>]]
vim.cmd [[nnoremap <Up> :resize +5<CR>]]
vim.cmd [[nnoremap <Down> :resize -5<CR>]]

-- Trouble Toggle custom mappings
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Trouble<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tw', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>TroubleToggle lsp_document_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tq', '<cmd>TroubleToggle quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TroubleToggle loclist<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>', { noremap = true, silent = true })

-- Vim Fugitive custom mappings
vim.api.nvim_set_keymap('n', '<leader>dh', ':diffget //2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':diffget //3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ds', ':Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', ':Git push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dS', ':Git status<CR> :e<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dP', ':Git stash pop<CR> :e<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>db', ':Git branch<CR>', { noremap = true, silent = true })

-- Gitsigns custom custom mappings
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gitsigns diffthis ~HEAD<CR>', { noremap = true, silent = true })
--
--Vim commentary custom mappings
vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })





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





-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },

  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
}





-- Telescope
local actions = require 'telescope.actions'
require('telescope').setup {
  defaults = {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    },

    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Tab>'] = actions.file_edit,
        ['<C-a>'] = actions.add_selection,
      },
    },
  },
}

require('telescope').load_extension('fzf')

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').file_browser({hidden = true, depth = 2})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope find_files hidden=true previewer=false <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pr', ':Telescope projects<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope git_status<CR>', { noremap = true, silent = true })





-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'css',
    'graphql',
    'html',
    'javascript',
    'typescript',
    'python',
    'regex',
    'bash',
    'toml',
    'yaml',
    'json',
    'lua',
    'tsx'
  },

  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },

  indent = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },

      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },

      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },

      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },

  context_commentstring = {
    enable = true
  },

  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<leader>td",
        list_definitions = "<leader>tl"
      }
    },
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },

  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'javascriptreact',
      'typescriptreact',
    },

    skip_tags = {
      'input',
      'link',
      'img',
    },
  },
}





-- LSP settings
local nvim_lsp = require 'lspconfig'

 local on_attach = function(_, bufnr)
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   local opts = { noremap = true, silent = true }
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
   vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
 end

 -- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
properties = {
  'documentation',
  'detail',
  'additionalTextEdits',
  }
}





vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = 'single',
})





-- Enable the following language servers

nvim_lsp.dartls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.graphql.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}






nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require('nvim-lsp-ts-utils')

    -- defaults
    ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        -- lower numbers indicate higher priority
        import_all_priorities = {
            same_file = 1, -- add to existing import statement
            local_files = 2, -- git files or files with relative path markers
            buffer_content = 3, -- loaded buffer content
            buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = 'eslint_d',
        eslint_enable_diagnostics = true,
        eslint_opts = {
          diagnostics_format = '#{m} [#{c}]',
        },

        -- formatting
        enable_formatting = false,
        formatter = 'prettier',
        formatter_opts = {},

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = true,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        -- filter out dumb module warning
        filter_out_diagnostics_by_code = { 80001 },
        flags = {
          debounce_text_changes = 150,
        },
    }

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':TSLspRenameFile<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'qq', ':TSLspFixCurrent<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end
}





-- sumneko lua ls
USER = vim.fn.expand('$USER')

local sumneko_root_path = ''
local sumneko_binary = ''

if vim.fn.has('mac') == 1 then
   sumneko_root_path = '/Users/' .. USER .. '/.config/nvim/lua-language-server'
   sumneko_binary = '/Users/' .. USER .. '/.config/nvim/lua-language-server/bin/macOS/lua-language-server'
elseif vim.fn.has('unix') == 1 then
   sumneko_root_path = '/home/' .. USER .. '/.config/nvim/lua-language-server'
   sumneko_binary = '/home/' .. USER .. '/.config/nvim/lua-language-server/bin/Linux/lua-language-server'
else
   print('Unsupported system for sumneko')
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
 on_attach = on_attach,
 capabilities = capabilities,
 cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
 settings = {
   Lua = {
     runtime = {
       -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
       version = 'LuaJIT',
       -- Setup your lua path
       path = runtime_path,
     },
     diagnostics = {
       -- Get the language server to recognize the `vim` global
       enable = true,
       globals = { 'vim' },
     },
     workspace = {
       -- Make the server aware of Neovim runtime files
       library = vim.api.nvim_get_runtime_file('', true),
       maxPreload = 10000, -- Add this if missing or increase it
       preloadFileSize = 10000, -- Add this if missing or increase it
       checkThirdParty = false,
     },
     -- Do not send telemetry data containing a randomized but unique identifier
     telemetry = {
       enable = false,
     },
   },
 },
 flags = {
   debounce_text_changes = 150,
 },
}





-- luasnip setup
local luasnip = require 'luasnip'





-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
 snippet = {
   expand = function(args)
     luasnip.lsp_expand(args.body)
   end,
 },

 mapping = {
   ['<C-k>'] = cmp.mapping.select_prev_item(),
   ['<C-j>'] = cmp.mapping.select_next_item(),
   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
   ['<C-f>'] = cmp.mapping.scroll_docs(4),
   ['<C-Space>'] = cmp.mapping.complete(),
   ['<C-e>'] = cmp.mapping.close(),
   ['<Tab>'] = cmp.mapping.confirm {
     behavior = cmp.ConfirmBehavior.Replace,
     select = true,
   },

   ['<S-Tab>'] = function(fallback)
     if cmp.visible() then
       cmp.select_prev_item()
     elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
     else
       fallback()
     end
   end,
 },

sources = {
   { name = 'nvim_lsp' },
   { name = 'luasnip' },
   { name = 'cmp_tabnine' },
 },
}

