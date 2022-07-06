-- autocommands
vim.api.nvim_exec(
  [[
    augroup Random
      autocmd!
      autocmd BufWritePre * %s/\s\+$//e
      autocmd InsertEnter * :normal zz
      autocmd TextYankPost * silent! lua vim.highlight.on_yank() -- Hightlight on yank
      autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
    augroup end
  ]],

  false
)

-- Hide lsp diagnostics virtual text
vim.nvim_tui_enable_true_color = true

-- What is going on here again?
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

