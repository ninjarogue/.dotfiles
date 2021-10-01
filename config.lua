-- lvim is the global options object

-- Linters should be filled in as strings with either a global executable or a path to an executable

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile


-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.updatetime = 300
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.wildignore = '*/node_modules/**'
vim.opt.shiftwidth = 2
vim.opt.joinspaces = false
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.spell = false
vim.opt.wrap = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"
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



-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping lvim.keys.normal_mode["<C-Up>"] = ""
-- add your own keymapping
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["<leader>j"] = "J"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["<C-n>"] = ":nohl<CR>"
lvim.keys.normal_mode["<leader>q"] = ":q<CR>"
lvim.keys.normal_mode["<C-h>"] = "_"
lvim.keys.normal_mode["<C-l>"] = "g_"
lvim.keys.normal_mode["H"] = ":BufferPrevious<cr>"
lvim.keys.normal_mode["L"] = ":BufferNext<cr>"
vim.cmd('nnoremap Y yg$')
vim.cmd('nnoremap <leader>d "_d')
vim.cmd("nnoremap ytp vf)y")
vim.cmd('vnoremap <leader>d "_d')
lvim.keys.visual_mode["<leader>j"] = "J"
vim.cmd("xnoremap <leader>p \"_dP")
vim.cmd("nnoremap cc :Git commit<cr>")
vim.cmd("nnoremap cp :Git push<cr>")
vim.cmd("nnoremap dv :Gitvdiffsplit<cr>")
vim.cmd("nnoremap <leader>ww :wq<cr>")
vim.cmd("nnoremap <S-w> <C-w>")
vim.cmd("nnoremap <S-u> <C-u>")
vim.cmd("nnoremap <S-d> <C-d>")


-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},

    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },

    {"tpope/vim-fugitive"},

    {"ray-x/lsp_signature.nvim"},

    {"folke/lsp-colors.nvim"},

    {
      "windwp/nvim-ts-autotag",
      event="InsertEnter",
    },

    {
      "phaazon/hop.nvim",
      config = function()
        require("user.hop").config()
      end
    },

    { "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "user.blankline"
      end
    },

    {
      "unblevable/quick-scope",
      config = function()
        require "user.quickscope"
      end
    },

    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        require "user.matchup"
      end
    },

    {
      "nacro90/numb.nvim",
      event = "BufRead",
      config = function()
        require("user.numb").config()
      end,
    },

    {
      "abecodes/tabout.nvim",
      config = function()
        require("user.tabout").config()
      end,
      wants = { "nvim-treesitter" }, -- or require if not used so far
      after = { "nvim-cmp", "LuaSnip" } -- if a completion plugin is using tabs load it before
    },

    {
      "tzachar/cmp-tabnine",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
        }
      end,

      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    },

    {
      "karb94/neoscroll.nvim",
      config = function()
        require("user.neoscroll").config()
      end,
    },
}



-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.nvimtree.icons.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    filetypes = { "html" , "typescriptreact", "javascriptreact" },
  }
}



lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.setup.view.width = 60



-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  lvim.builtin.telescope.defaults.mappings.i["<Tab>"] = actions.file_edit
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["l"] = actions.file_edit
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end



-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["v"] = {
  name = 'Vim Fugitive',
  s = { "<cmd>G<cr>", "Git Status" },
  c = { "<cmd>Git commit<cr>", "Git Commit" },
  h = { "<cmd>diffget //3<cr>", "Diff Get 3" },
  u = { "<cmd>diffget //2<cr>", "Diff Get 2" },
  l = { "<cmd>Gclog -- %<cr>", "Gclog For Current File" }
}



lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true



-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end



-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
lvim.lsp.null_ls.setup = {
  root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
}
-- or if you need something more advanced
lvim.lsp.null_ls.setup.root_dir = function(fname)
  if vim.bo.filetype == "javascript" then
    return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
      or require("lspconfig/util").path.dirname(fname)
  elseif vim.bo.filetype == "php" then
    return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
  else
    return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
  end
end



 cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  transpancy = 10, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
  handler_opts = {
    border = "single"   -- double, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

require'lsp_signature'.setup(cfg)
require'lsp_signature'.on_attach(cfg)



lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.linters = { { exe = "eslint_d" } }
lvim.format_on_save = false



require('hop').setup{
  keys = 'etovxqpdygfblzhckisuran',
  term_seq_bias = 0.5
}

require('lsp-colors').setup{
  error = "#db4b4b",
  warning = "#e0af68",
  information = "#0db9d7",
  hint = "#10b981"
}



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  {"InsertEnter", "*", ":normal zz"}
}

lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*", ":PackerLoad nvim-autopairs" },
}



vim.cmd [[ autocmd BufWritePre *.tsx %s/\s\+$//e" ]]

