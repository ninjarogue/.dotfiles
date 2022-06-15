return function()
  local status_ok, telescope = pcall(require, 'telescope')

  if not status_ok then
    return
  end

  local actions = require 'telescope.actions'
  local action_layout = require 'telescope.actions.layout'
  local fb_actions = require 'telescope'.extensions.file_browser.actions

  telescope.setup {
    defaults = {
      cache_picker = {
        num_pickers = 3
      },
      prompt_prefix = "   ",
      color_devicons = true,
      selection_caret = [[🍩 ]],
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      file_ignore_patterns = { 'node_modules', '.git' },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          height = 0.95,
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Tab>'] = actions.file_edit,
          ['<C-x>'] = actions.toggle_selection,
          ['<C-d>'] = actions.delete_buffer,
          ['<C-p>'] = action_layout.toggle_preview,
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,
          ['<C-l>'] = action_layout.cycle_layout_next,
        },

        n = {
          ['<C-d>'] = actions.delete_buffer,
          ['<C-n>'] = actions.remove_selection,
          ['H'] = actions.move_to_top,
          ['M'] = actions.move_to_middle,
          ['L'] = actions.move_to_bottom,
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,
          ['<C-p>'] = action_layout.toggle_preview,
          ['<C-l>'] = action_layout.cycle_layout_next,
        }
      },

      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new
    },

    pickers = {
      buffers = {
        -- sort_lastused = true,
        sort_mru = true,
        disable_devicons = true,
        ignore_current_buffer = true,
        theme = 'ivy',
        previewer = false,
        shorten_path = true,
        path_display = { shorten = 5 },
        mappings = {
          ['i'] = {
            ['<C-v>'] = actions.select_all,
          },

          ['n'] = {
            ['<C-v>'] = actions.select_all,
          }
        }
      },

      find_files = {
        -- find_command = { 'fd', '--type=file', '--hidden', '--smart-case' },
        theme = 'ivy',
        disable_devicons = false,
        previewer = false,
        mappings = {
          ['n'] = {
            ['<C-h>'] = fb_actions.toggle_hidden,
          },

          ['i'] = {
            ['<C-h>'] = fb_actions.toggle_hidden
          }
        },
      },

      oldfiles = {
        disable_devicons = false,
        theme = 'ivy',
        previewer = false,
      },

      live_grep = {
        shorten_path = true,
        path_display = { shorten = 5 },
        theme = 'ivy',
        only_sort_text = true,
      },
    },

    extensions = {
      find_cmd = 'fd',
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },

      file_browser = {
        theme = 'ivy',
        disable_devicons = true,
      }
    },
  }
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('file_browser')
  require('telescope').load_extension('repo')
  require('telescope').load_extension('zoxide')
  require('telescope').load_extension('neoclip')
  --Add leader shortcuts
  vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers({previewer = false})<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').search_history()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>ss', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>ca', [[<cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>km', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>sr', ':Telescope resume<CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles({hidden = true})<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<space>fb', [[<cmd>lua require 'telescope'.extensions.file_browser.file_browser({cwd = require('telescope.utils').buffer_dir()})<CR>]], {noremap = true})

  vim.api.nvim_set_keymap('n', '<leader>dg', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], { noremap = true, silent = true })
end

