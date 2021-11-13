-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.leader = 'space'
lvim.log.level = 'warn'
lvim.transparent_window = 'true'
lvim.lsp.diagnostics.virtual_text = false
-- debugger
lvim.builtin.dap.active = false
vim.g.gruvbox_dark_sidebar = true
lvim.colorscheme = 'gruvbox-flat'
lvim.builtin.lualine.options.theme = 'gruvbox-flat'

-- set options
vim.opt.mouse = 'a'
vim.api.swapfile = false
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wildignore = '*/node_modules/**'
vim.opt.joinspaces = false
vim.opt.undofile = true
vim.opt.linespace = 3

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.hid = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.spell = false
vim.opt.wrap = false
vim.opt.completeopt = { 'menuone', 'noselect' }
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
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file



lvim.builtin.terminal.execs = {{}}
lvim.builtin.dashboard.active = true



-- unmap a default keymapping lvim.keys.normal_mode['<C-Up>'] = ''
-- overwrite lvim default keys
require('user.mappings');
require('user.plugins');
-- remaps and misc settings
require('user.cmp');
require('user.which-key');
require('user.telescope');
require('user.treesitter');
require('user.nvimtree');
require('user.symbols-outline');
require('user.better-escape');
require('user.lsp-signature');

-- Formatters and Linters
lvim.lang.javascript.linters = { { exe = 'eslint_d' } }
lvim.lang.typescript.linters = { { exe = 'eslint_d' } }
lvim.lang.typescriptreact.linters = { { exe = 'eslint_d' } }
lvim.lang.javascriptreact.linters = { { exe = 'eslint_d' } }
lvim.lang.lua.linters = { { exe = 'luacheck' } }
lvim.format_on_save = false



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
        { 'BufWinEnter', '*.lua', 'setlocal ts=8 sw=8' },
        {'InsertEnter', '*', ':normal zz'},
        { 'BufWinEnter', '*', ':PackerLoad nvim-autopairs' },
        { 'BufWritePre', '*', [[%s/\s\+$//e"]]},
}

