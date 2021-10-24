vim.opt.list = true
vim.opt.listchars:append("space:⋅")

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"

vim.g.indent_blankline_filetype_exclude = {
  "help",
  "terminal",
  "dashboard",
  "lspinfo",
  "lsp-installer",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true

vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_use_treesitter = true

