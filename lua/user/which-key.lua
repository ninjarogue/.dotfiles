lvim.builtin.which_key.opts.timeoutlen = 500

lvim.builtin.which_key.setup["triggers_blacklist"] = {
  n = { "w", "c", "j" }
}



lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<CR>", "References" },
  f = { "<cmd>Trouble lsp_definitions<CR>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<CR>", "Document Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
}



lvim.builtin.which_key.mappings["d"] = {
  name = "Vim Fugitive",
  c = { "<cmd>Git commit<CR>", "Git Commit"},
  h = { "<cmd>diffget //3<cr>", "Diff Get 2" },
  l = { "<cmd>diffget //2<cr>", "Diff Get 3" },
  p = { "<cmd>Git push<CR>", "Git Push"},
  s = { "<cmd>G<CR>", "Git Status"},
  v = { "<cmd>Gitvdiffsplit<CR>"},
}



local opts = { noremap = true, silent = true }
lvim.builtin.which_key.mappings["r"] = {
  name = "Quick Grep",
  g = { [[<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], opts }
}



lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }

