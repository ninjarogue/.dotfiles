local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'rg',  [[<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], opts) -- ripgrep string



-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
local actions = require "telescope.actions"
lvim.builtin.telescope.defaults.mappings = {
  i = {
    ['<C-j>'] = actions.move_selection_next,
    ['<C-k>'] = actions.move_selection_previous,
    ['<C-n>'] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<Tab>"] = actions.file_edit,
    ["<C-q>"] = actions.send_to_qflist,
    ["<C-a>"] = actions.add_selection,
    ["<C-z>"] = actions.remove_selection,
  },

  n = {
    ["l"] = actions.file_edit,
                      -- for normal mode
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-a>"] = actions.add_selection,
    ["<C-z>"] = actions.remove_selection,
    ["<C-c>"] = actions.close,
  }
}

lvim.builtin.telescope.extensions = {
  media_files = {
    filetypes = {"png", "webp", "jpg", "jpeg"}
  }
}

