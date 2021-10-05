-- lvim is the global options object

-- Linters should be filled in as strings with either a global executable or a path to an executable

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile



lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox-material"
lvim.lsp.diagnostics.virtual_text = false

vim.g.gruvbox_material_transparent_background = 1


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
vim.opt.cursorline = false
vim.opt.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
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

lvim.transparent_window = "true"



lvim.plugins = {
  { "folke/tokyonight.nvim" },

  { "sainnhe/gruvbox-material" },

  {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
  },

  {"tpope/vim-fugitive"},

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
    event="InsertEnter",
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

  { "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.blankline"
    end,
  },

  {
    "unblevable/quick-scope",
    config = function()
      require "user.quickscope"
    end,
  },

  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
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
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true
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

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup{
        highlight_hovered_item = true,
        show_guides = true,
      }
      require "user.symbols-outline"
    end,
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



-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping lvim.keys.normal_mode["<C-Up>"] = ""
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["<C-n>"] = ":nohl<CR>"
lvim.keys.normal_mode["H"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["L"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<leader>q"] = ":q<CR>"
lvim.keys.normal_mode["<leader>w"] = ":w<CR>"
lvim.keys.normal_mode["wq"] = ":wq<CR>"

vim.cmd('nnoremap Y yg_')
vim.cmd('nnoremap <leader>d "_d')
vim.cmd("nnoremap ytp vf)y")
-- vim.cmd("nnoremap cc :Git commit<CR>")
-- vim.cmd("nnoremap cp :Git push<CR>")
vim.cmd("nnoremap dv :Gitvdiffsplit<CR>")
vim.cmd("nnoremap <S-w> <C-w>")
vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-j> <C-w>j")

vim.cmd("nnoremap <C-l> <C-w>l")
vim.cmd("inoremap , ,<c-g>u")
vim.cmd("inoremap . .<c-g>u")
vim.cmd("inoremap ? ?<c-g>u")
vim.cmd("inoremap <C-e> <C-o>a")
vim.cmd("nnoremap zj mzyyp`z")
vim.cmd("nnoremap zk mzyyP`z")
vim.cmd("vnoremap zj y%p")
vim.cmd("vnoremap zk y%P")
vim.cmd('nnoremap J mzJ`z')
vim.cmd('vnoremap <leader>d "_d')
vim.cmd('xnoremap <leader>p "_dP')
-- walk back
vim.cmd('nnoremap <expr> k (v:count > 5 ? "m\'" . v:count : "") . "k"')
vim.cmd('nnoremap <expr> j (v:count > 5 ? "m\'" . v:count : "") . "j"')
vim.cmd('nnoremap <M-j> :m .+1<cr>==')
vim.cmd('nnoremap <M-k> :m .-2<cr>==')


lvim.builtin.cmp.mapping['<Tab>'] = require("cmp").mapping.confirm({ select = true })

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.theme = "gruvbox"
lvim.builtin.bufferline.active = true

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true



lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.setup.view.width = 60
lvim.builtin.nvimtree.icons.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}



-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  lvim.builtin.telescope.defaults.mappings.i["<Tab>"] = actions.file_edit
  lvim.builtin.telescope.defaults.mappings.i["<C-q>"] = actions.send_to_qflist
  lvim.builtin.telescope.defaults.mappings.i["<Esc>"] = actions.close
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["l"] = actions.file_edit
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

lvim.builtin.terminal.execs = { }

lvim.builtin.which_key.setup["triggers_blacklist"] = {
  n = { "w", "c" }
}

lvim.builtin.which_key.opts.timeoutlen = 500
-- lvim.builtin.which_key.mappings['w'] = "which_key_ignore"
-- lvim.builtin.which_key.mappings['<leader>p'] = "which_key_ignore"
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings.g["g"] = {
  name = 'Vim Fugitive',
  s = { "<cmd>G<cr>", "Git Status" },
  h = { "<cmd>diffget //3<cr>", "Diff Get 3" },
  l = { "<cmd>diffget //2<cr>", "Diff Get 2" },
  c = { "<cmd>Git commit<CR>", "Git Commit" },
  p = { "<cmd>Git push<CR>", "Git Push" }
}



-- Formatters and Linters
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.linters = { { exe = "eslint_d" } }
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



-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end



-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- -- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

