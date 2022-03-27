local M = {}

M.config = function()
  local status_ok, cmp = pcall(require, 'cmp')

  if not status_ok then
    return
  end

  local luasnip = require 'luasnip'
  local lspkind = require 'lspkind'
  lspkind.init()

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }
    },

    sources = {
      { name = 'rg' },
      { name = 'nvim_lsp' },
      { name = 'cmp_tabnine' },
      { name = 'path' },
      { name = 'luasnip' },
      {
        name = 'buffer',
        keyword_length = 5,
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
       },
     },

    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          nvim_lsp = '[LSP]',
          nvim_lua = '[api]',
          path = '[path]',
          buffer = '[buf]',
          gh_issues = '[issues]',
          treesitter = "",
          tn = '[TabNine]'
        }
      }
    },

    experimental = {
      native_menu = false,
      ghost_text = true
    },
  }
end

return M

