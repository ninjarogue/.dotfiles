--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

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
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["<leader>j"] = "J"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["<C-n>"] = ":nohl<CR>"
lvim.keys.normal_mode["<leader>q"] = ":q<CR>"
lvim.keys.normal_mode["H"] = "_"
lvim.keys.normal_mode["L"] = "g_"
lvim.keys.normal_mode["<C-h>"] = ":BufferPrevious<cr>"
lvim.keys.normal_mode["<C-l>"] = ":BufferNext<cr>"



vim.cmd("xnoremap p \"_dP")
vim.cmd("inoremap jk <esc>")
vim.cmd("inoremap kj <esc>")
vim.cmd("inoremap jj <esc>")



lvim.keys.visual_mode["Y"] = "y$"
lvim.keys.visual_mode["<leader>j"] = "J"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true



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

-- see :help hop for more commands
lvim.builtin.which_key.mappings["h"] = { 
  name = "Hop",
  h = { "<cmd>lua require'hop'.hint_char2()<cr>", "Hop" }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
}


lvim.builtin.which_key.mappings["gf"] = {
  name = 'Vim Fugitive',
  s = { "<cmd>G<cr>", "Git Status" },
  h = { "<cmd>diffget //3<cr>", "Diff Get 3" },
  u = { "<cmd>diffget //2<cr>", "Diff Get 2" },
  l = { "<cmd>Gclog -- %<cr>", "Gclog For Current File" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true




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

  transpancy = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}



require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    filetypes = { "html" , "typescriptreact", "javascriptreact" },
  }
}



require'lsp_signature'.setup(cfg)
require'lsp_signature'.on_attach(cfg)

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
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


require('trouble').setup{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}



lvim.builtin.nvimtree.icons.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}

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
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
      require "user.blankline"
      end
    }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  {"InsertEnter", "*", ":normal zz"}
}

vim.cmd [[ autocmd BufWritePre *.tsx %s/\s\+$//e" ]]

