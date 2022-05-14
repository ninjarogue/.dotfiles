return function()
  local status_ok, gitsigns = pcall(require, 'gitsigns')

  if not status_ok then
    return
  end

  gitsigns.setup {
    signs = {
      add = { hl = 'GitGutterAdd', text = '+' },
      change = { hl = 'GitGutterChange', text = '~' },
      delete = { hl = 'GitGutterDelete', text = '_' },
      topdelete = { hl = 'GitGutterDelete', text = '‾' },
      changedelete = { hl = 'GitGutterChange', text = '~' },
    },

    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
          opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- Navigation
      map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
      map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

      -- Actions
      map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
      map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
      map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
      map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
      map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
      map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      map('n', '<leader>hl', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      map('n', '<leader>hd', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  }
end

