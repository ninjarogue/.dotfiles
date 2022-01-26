-- autocommands
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

-- Hide lsp diagnostics virtual text
vim.nvim_tui_enable_true_color = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.lualine = {
  options = {
    theme = 'onenord'
  }
}

