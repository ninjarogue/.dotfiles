local M = {}

M.config = function()
  local status_ok, telescope = pcall(require, 'telescope')

  if not status_ok then
    return
  end

  local actions = require 'telescope.actions'

  telescope.setup {
    defaults = {
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      },

      mappings = {
        i = {
          ['<C-u>'] = true,
          ['<C-d>'] = true,
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Tab>'] = actions.file_edit,
          ['<C-x>'] = actions.add_selection,
        },
      },
    },
  }

  require('telescope').load_extension('fzf')

  --Add leader shortcuts
  vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers({previewer = false})<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files hidden=true previewer=false <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser({hidden = true, depth = 2})<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').search_history()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>pr', ':Telescope projects<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope git_status<CR>', { noremap = true, silent = true })
end

return M

