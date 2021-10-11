local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-p>',  [[<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], opts) -- ripgrep string



-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  lvim.builtin.telescope.defaults.mappings.i["<Tab>"] = actions.file_edit
  lvim.builtin.telescope.defaults.mappings.i["<C-q>"] = actions.send_to_qflist
  lvim.builtin.telescope.defaults.mappings.i["<Esc>"] = actions.close
  lvim.builtin.telescope.defaults.mappings.i["<C-a>"] = actions.add_selection
  lvim.builtin.telescope.defaults.mappings.i["<C-z>"] = actions.remove_selection
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["l"] = actions.file_edit
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.n["<C-a>"] = actions.add_selection
  lvim.builtin.telescope.defaults.mappings.n["<C-z>"] = actions.remove_selection
  lvim.builtin.telescope.defaults.mappings.n["<C-c>"] = actions.close
end

