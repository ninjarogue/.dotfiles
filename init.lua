require('plugins')
require('globals')
require('options')
require('mappings')



-- require('onedark').setup {
--     style = 'darker'
-- }



--load colorscheme after configuration
  vim.g.gruvbox_flat_style = 'dark'
  vim.g.gruvbox_dark_sidebar = true
  vim.g.gruvbox_sidebars = { "qf", "terminal", "packer" }
  vim.g.gruvbox_colors = {
    fg = "#D4D298",
  }

vim.cmd('colorscheme gruvbox-flat')

