local M = {}

M.config = function()
  local status_ok, nvim_tree = pcall(require, 'nvim-tree')

  if not status_ok then
    return
  end

  local tree_cb = require('nvim-tree.config').nvim_tree_callback

  nvim_tree.setup {
    hijack_netrw = true,
    open_on_setup = false,
    auto_close = true,
    open_on_tab = false,
    update_focused_file = {
      enable = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 50,
      side = "left",
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        }
      },
    },
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    ignore = { ".git", "node_modules", ".cache" },
    hide_dotfiles = 0,
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
    git_hl = 1,
    allow_resize = 1,
    quit_on_open = 0,
  }
end

return M

