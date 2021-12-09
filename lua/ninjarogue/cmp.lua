local luasnip = require 'luasnip'
local lspkind = require 'lspkind'


-- nvim-cmp setup
local cmp = require 'cmp'
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
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

   ['<S-Tab>'] = function(fallback)
     if cmp.visible() then
       cmp.select_prev_item()
     elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
     else
       fallback()
     end
   end,
  },

  sources = {
     { name = 'nvim_lsp' },
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
     { name = 'cmp_tabnine' },
     { name = 'path' },
     { name = 'luasnip' },
   },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "ﲳ",
        nvim_lua = "",
        path = "ﱮ",
        buffer = "﬘",
        treesitter = "",
        -- zsh = "",
        -- spell = "暈"
      }
    }
  },

  experimental = {
    native_menu = false,
    ghost_text = true
  },
}

