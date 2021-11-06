local opts = {noremap=true, silent=true}
local function map(mode, key, mapping)
  vim.api.nvim_set_keymap(mode, key, mapping, opts)
end



lvim.keys.insert_mode['jj'] = '<C-o>a'
lvim.keys.insert_mode['kk'] = '<C-o>h'
lvim.keys.visual_mode['zj'] = 'mzy`zpgv'
lvim.keys.visual_mode['zk'] = 'mzy`Pgv'
lvim.keys.normal_mode['<C-n>'] = ':nohl<CR>'
lvim.keys.normal_mode['H'] = ':BufferPrevious<CR>'
lvim.keys.normal_mode['L'] = ':BufferNext<CR>'
lvim.keys.normal_mode['<leader>q'] = ':q<CR>'
lvim.keys.normal_mode['<leader>w'] = ':w<CR>'
lvim.keys.normal_mode['wq'] = ':wq<CR>'
lvim.keys.normal_mode['<leader>j'] = 'mzJ`z'
lvim.keys.normal_mode['J'] = '5j'
lvim.keys.normal_mode['K'] = '5k'
lvim.keys.normal_mode['<leader>='] = 'ggVG=``<CR>'
lvim.keys.normal_mode['U'] = '<C-R>'
lvim.keys.normal_mode['+'] = ':vertical resize +5<CR>'
lvim.keys.normal_mode['_'] = ':vertical resize -5<CR>'
lvim.keys.visual_block_mode['<leader>p'] = '"_dP'
-- lvim.keys.normal_mode['<leader>p'] = '



map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', '?', '?<C-g>u')
map('n', '<C-s>', ':w<CR>')
map('n', 'Y', 'yg_')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '0', '^')
map('x', ')', 'f)')
map('x', '}', 'f}')
map('v', 'J', '5j')
map('v', 'K', '5k')
map('n', '<C-h>', '<C-w>h');
map('n', '<C-j>', '<C-w>j');
map('n', '<C-k>', '<C-w>k');
map('n', '<C-l>', '<C-w>l');
map('n', 'Y', 'yg_')
map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')
map('n' , '<S-w>', '<C-w>')
map('n' , 'zj', 'mzyyp`z')
map('n', 'zk', 'mzyyP`z')
map('v', 'zj', 'y%p')
map('v', 'zk', 'y%P')
map('n', '<M-j>', ':m .+1<cr>==')
map('n', '<M-k>', ':m .-2<cr>==')
map('v', '$', 'g_')
map('v', '0', '_')
map('n', 'Q', 'q')
map('n', 'q', '<Nop>')
map('n', 'x', '"_x')



-- walk back
vim.cmd('nnoremap <expr> k (v:count > 5 ? "m\'" . v:count : "") . "k"')
vim.cmd('nnoremap <expr> j (v:count > 5 ? "m\'" . v:count : "") . "j"')

