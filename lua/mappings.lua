--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<C-o>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kk', '<C-o>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<cr>==', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<cr>==', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '$', 'g_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '0', '_', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'q', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', 'q', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.cmd[[nnoremap <A-j> :move .+1<CR>==]]
vim.cmd[[nnoremap <A-k> :move .-2<CR>==]]
vim.cmd[[inoremap <silent> <A-j> <Esc>:move .+1<CR>==gi]]
vim.cmd[[inoremap <silent> <A-k> <Esc>:move .-2<CR>==gi]]
vim.cmd[[xnoremap <silent> <A-j> :move '>+1<CR>gv-gv]]
vim.cmd[[xnoremap <silent> <A-k> :move '<-2<CR>gv-gv]]

vim.api.nvim_set_keymap('n', '<leader>j', 'mzJ`z', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', 'yg_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':vs<CR>', { noremap = true, silent = true }) -- vertical split
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>zzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', { noremap = true, silent = true })

-- Copy from clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>P', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+p', { noremap = true, silent = true })

vim.cmd [[nnoremap oo mzo<Esc>`z]]
vim.cmd [[nnoremap OO mzO<Esc>`z]]
vim.cmd [[nnoremap <leader>nv :e ~/.config/nvim/init.lua<CR>]]
vim.cmd [[nnoremap <Left>  :vertical resize +5<CR>]]
vim.cmd [[nnoremap <Right> :vertical resize -5<CR>]]
vim.cmd [[nnoremap <Up> :resize +5<CR>]]
vim.cmd [[nnoremap <Down> :resize -5<CR>]]

vim.cmd [[nnoremap <C-s> :source $MYVIMRC<CR>]]

vim.cmd[[xnoremap J :co '><CR>V'[=gv]]
vim.cmd[[nnoremap J mzyyp`z]]
-- Trouble Toggle custom mappings
vim.api.nvim_set_keymap('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tq', '<cmd>TroubleToggle quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TroubleToggle loclist<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>', { noremap = true, silent = true })

-- Vim Fugitive custom mappings
vim.api.nvim_set_keymap('n', '<leader>fh', ':diffget //2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fl', ':diffget //3<CR>', { noremap = true, silent = true })
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

-- this remap is overwriting the vim fugitive remap for resolving merge conflicts
-- vim.cmd [[nnoremap <leader>dd :call vimspector#Launch()<CR>]]
vim.cmd [[nnoremap <leader>de :call vimspector#Reset()<CR>]]
vim.cmd [[nnoremap <leader>dc :call vimspector#Continue()<CR>]]
vim.cmd [[nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>]]
vim.cmd [[nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>]]

vim.cmd [[nmap <leader>dk <Plug>VimspectorRestart]]
vim.cmd [[nmap <leader>dh <Plug>VimspectorStepOut]]
vim.cmd [[nmap <leader>dl <Plug>VimspectorStepInto]]
vim.cmd [[nmap <leader>dj <Plug>VimspectorStepOver]]

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })


--- Todo comments
vim.api.nvim_set_keymap('n', '<leader>tf', ':TodoQuickFix<CR>', { noremap = true, silent = true })

-- Glow
vim.api.nvim_set_keymap('n', '<leader>go', ':Glow<CR>', { noremap = true, silent = true })
vim.cmd [[nnoremap <C-w>z <C-w>\|<C-w>_]]

