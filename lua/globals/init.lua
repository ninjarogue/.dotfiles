-- Hide lsp diagnostics virtual text
vim.diagnostic.config({virtual_text = false})

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

vim.g.lightline = {
  -- colorscheme = 'gruvbox-flat',
  colorscheme = 'tokyonight',

  active = {
    left = {
      { 'mode', 'paste' },
      {
        'gitbranch',
        'readonly',
        'filename',
        'modified'
      }
    }
  },

  component_function = { gitbranch = 'fugitive#head' },
}



 -- vim.g.gruvbox_flat_style = 'dark'
 -- vim.g.gruvbox_dark_sidebar = true
 -- vim.g.gruvbox_sidebars = { "qf", "terminal", "packer" }
 -- vim.g.gruvbox_colors = {
 --   fg = "#D4D298",
 -- }

