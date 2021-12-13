
require('plugins')
require('globals')
require('options')
require('mappings')

-- load colorscheme after configuration
vim.cmd [[colorscheme gruvbox-flat]]



vim.api.nvim_exec(
  [[
    augroup Random
      autocmd!
      autocmd BufWritePre * %s/\s\+$//e
      autocmd InsertEnter * :normal zz
      autocmd TextYankPost * silent! lua vim.highlight.on_yank() -- Hightlight on yank
    augroup end
  ]],

  false
)

