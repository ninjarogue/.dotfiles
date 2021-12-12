


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



local nightfox = require('nightfox')
nightfox.setup{
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  }
}
nightfox.load()



vim.g.lightline = {
  colorscheme = 'nightfox',

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

-- load colorscheme after configuration
-- vim.cmd [[colorscheme gruvbox-flat]]



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



require('plugins')
require('options')
require('mappings')

