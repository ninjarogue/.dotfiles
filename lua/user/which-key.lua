lvim.builtin.which_key.opts.timeoutlen = 500

lvim.builtin.which_key.setup['triggers_blacklist'] = {
  n = { 'w', 'c', 'j' }
}


lvim.builtin.which_key.mappings['='] = 'which_key_ignore'
lvim.builtin.which_key.mappings['j'] = 'which_key_ignore'
lvim.builtin.which_key.mappings['?'] = { '<cmd>Cheatsheet<CR>', 'Cheatsheet' }

lvim.builtin.which_key.mappings['t'] = {
  name = '+Trouble',
  r = { '<cmd>Trouble lsp_references<CR>', 'References' },
  f = { '<cmd>Trouble lsp_definitions<CR>', 'Definitions' },
  d = { '<cmd>Trouble lsp_document_diagnostics<CR>', 'Document Diagnostics' },
  q = { '<cmd>Trouble quickfix<cr>', 'QuickFix' },
  l = { '<cmd>Trouble loclist<cr>', 'LocationList' },
  w = { '<cmd>Trouble lsp_workspace_diagnostics<CR>', 'Workspace Diagnostics' },
}



lvim.builtin.which_key.mappings['d'] = {
  name = 'Vim Fugitive',
  l = { '<cmd>diffget //3<cr>', 'Diff get 2' },
  h = { '<cmd>diffget //2<cr>', 'Diff get 3' },
  p = { '<cmd>Git push<CR>', 'Git push'},
  s = { '<cmd>G<CR>', 'Git status'},
  S = { '<cmd>Git stash<CR> <cmd>e<CR>', 'Git stash'},
  P = { '<cmd>Git stash pop<CR> <cmd>e<CR>', 'Git stash pop'},
  b = { '<cmd>Git branch<CR>', 'Git branch' },
}



lvim.builtin.which_key.mappings['P'] = { '<cmd>Telescope projects<CR>', 'Projects' }
lvim.builtin.which_key.mappings['p'] = nil
lvim.builtin.which_key.mappings.l.o = { '<cmd>SymbolsOutline<cr>', 'Outline' }
lvim.builtin.which_key.mappings.s.s = { '<cmd>setlocal spell!<CR>', 'Toggle Spellchecking' }

