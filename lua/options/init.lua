local set = vim.opt

set.relativenumber = true
set.joinspaces = false
set.timeoutlen = 500
set.completeopt = 'menu,menuone,noselect' -- Set completeopt to have a better completion experience
set.inccommand = 'nosplit' --Incremental live completion (note: this is now a default on master)
set.showmode = false
set.hlsearch = true --Set highlight on search
set.swapfile = false
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
set.softtabstop = 2
set.expandtab = true
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
set.fileencoding = 'utf-8' -- the encoding written to a file
vim.wo.signcolumn = 'yes'
vim.wo.number = true --Make line numbers default
set.termguicolors = true --Set colorscheme (order is important here)
set.clipboard = 'unnamedplus'
set.cursorline = true --This might cause neovim to respond slowly especially for large files or files with long lines

