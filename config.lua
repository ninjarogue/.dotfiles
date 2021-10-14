-- lvim is the global options object Linters should be filled in as strings with either a global executable or a path to an executable

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
local opts = {noremap=true, silent=true}
local function map(mode, key, mapping) vim.api.nvim_set_keymap(mode, key, mapping, opts) end



lvim.leader = "space"
lvim.transparent_window = "true"
lvim.log.level = "warn"
lvim.lsp.diagnostics.virtual_text = false



lvim.colorscheme = "gruvbox-flat"


-- set options
vim.api.nvim_set_option('hid', true)
vim.api.swapfile = false
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.wildignore = '*/node_modules/**'
vim.opt.shiftwidth = 2
vim.opt.joinspaces = false
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.cursorline = false
vim.opt.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.spell = false
vim.opt.wrap = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.backup = false -- creates a backup file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.fileencoding = "utf-8" -- the encoding written to a file



lvim.plugins = {
  { "folke/tokyonight.nvim" },

  { "sainnhe/gruvbox-material" },

  { 'eddyekofo94/gruvbox-flat.nvim' },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {"tpope/vim-fugitive"},

  {"tpope/vim-surround"},

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("user.lsp-signature").config()
    end,
  },

  {
    "folke/lsp-colors.nvim",
    config = function()
      require('lsp-colors').setup{
        error = "#db4b4b",
        warning = "#e0af68",
        information = "#0db9d7",
        hint = "#10b981",
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event="BufReadPre",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  {
    "phaazon/hop.nvim",
    config = function()
      require("user.hop").config()
    end,
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
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("user.numb").config()
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
    "sudormrfbin/cheatsheet.nvim",
    requires = {
      {"nvim-telescope/telescope.nvim"},
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
    }
  },
}



-- unmap a default keymapping lvim.keys.normal_mode["<C-Up>"] = ""
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', '?', '?<C-g>u')
map('n', '<C-s>', ':w<CR>')
map('n', 'Y', 'yg_')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '0', '^')
map('v', ')', 'f)')
map('v', '}', 'f}')
map('v', '}', 'f}')
lvim.keys.insert_mode['jk'] = '<C-o>a'
lvim.keys.normal_mode["<C-n>"] = ":nohlsearch<CR>"
lvim.keys.normal_mode["H"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["L"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<leader>q"] = ":q<CR>"
lvim.keys.normal_mode["<leader>w"] = ":w<CR>"
lvim.keys.normal_mode["wq"] = ":wq<CR>"
lvim.keys.normal_mode["<leader>j"] = "mzJ`z'"
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["<leader>="] = "ggVG=``<CR>"
vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-j> <C-w>j")
vim.cmd("nnoremap <C-k> <C-w>k")
vim.cmd("nnoremap <C-l> <C-w>l")
vim.cmd('nnoremap Y yg_')
vim.cmd('nnoremap <leader>d "_d')
vim.cmd("nnoremap <S-w> <C-w>")
vim.cmd("nnoremap zj mzyyp`z")
vim.cmd("nnoremap zk mzyyP`z")
vim.cmd("vnoremap zj y%p")
vim.cmd("vnoremap zk y%P")
vim.cmd('vnoremap <leader>d "_d')
vim.cmd('xnoremap <leader>p "_dP')
-- walk back
vim.cmd('nnoremap <expr> k (v:count > 5 ? "m\'" . v:count : "") . "k"')
vim.cmd('nnoremap <expr> j (v:count > 5 ? "m\'" . v:count : "") . "j"')
vim.cmd('nnoremap <M-j> :m .+1<cr>==')
vim.cmd('nnoremap <M-k> :m .-2<cr>==')



vim.g.symbols_outline = {
  auto_preview = false,
  show_relative_numbers = true,
  keymaps = {
    goto_location = "<Tab>",
  },
}



lvim.builtin.terminal.execs = {{}}
lvim.builtin.dashboard.active = true
lvim.builtin.lualine.options.theme = "gruvbox-flat"

-- remaps and misc settings
require('user.cmp');
require('user.which-key');
require('user.telescope');
require('user.treesitter');
require('user.nvimtree');



-- Formatters and Linters
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.linters = { { exe = "eslint_d" } }
lvim.lang.lua.linters = { { exe = "luacheck" } }
lvim.format_on_save = false



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  {"InsertEnter", "*", ":normal zz"}
}

lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*", ":PackerLoad nvim-autopairs" },
}

vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e" ]]

