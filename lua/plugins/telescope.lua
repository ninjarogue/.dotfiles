local M = {}

M.config = function()
  local status_ok, telescope = pcall(require, 'telescope')

  if not status_ok then
    return
  end

  local actions = require 'telescope.actions'
  local fb_actions = require 'telescope'.extensions.file_browser.actions

  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Tab>'] = actions.file_edit,
          ['<C-x>'] = actions.add_selection,
          ["<C-d>"] = actions.delete_buffer,
        },

        n = {
          ["<C-d>"] = actions.delete_buffer,
        }
      },

      pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          ignore_current_buffer = true,
          theme = "dropdown",
          previewer = false,
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        },

        file_browser = {
          mappings = {
            ['n'] = {
              ['<C-h>'] = fb_actions.toggle_hidden
            },

            ['i'] = {
              ['<C-h>'] = fb_actions.toggle_hidden
            }
          }
        }
      },
    },
  }

  require('telescope').load_extension('fzf')
  require("telescope").load_extension('file_browser')
  --Add leader shortcuts
  vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers({previewer = false})<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files hidden=true previewer=false <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').search_history()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>lua require('telescope.builtin').oldfiles({hidden = true, previewer = false})<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>pr', ':Telescope projects<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope git_status<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<space>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", {noremap = true})
end

return M

