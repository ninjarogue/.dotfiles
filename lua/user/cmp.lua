local cmp = require('cmp')
lvim.builtin.cmp.mapping['<Tab>'] = cmp.mapping.confirm({ select = true })
lvim.builtin.cmp.mapping['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
lvim.builtin.cmp.mapping['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
lvim.builtin.cmp.sources = {
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "luasnip" },
  { name = "cmp_tabnine" },
  { name = "nvim_lua" },
  { name = "calc" },
  { name = "emoji" },
  { name = "treesitter" },
  { name = "crates" },
}

