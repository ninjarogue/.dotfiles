local M = {}

M.config = function()
  local status_ok, nvim_lsp = pcall(require, 'lspconfig')

  if not status_ok then
    return
  end



  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-t>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end



    -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } } -- does this create a tag file?
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
    }
  }

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false
  })

  local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

  local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"}
  }

  local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end

  -- Enable the following language servers
  nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
            command = "clippy"
        },
        assist = {
            importGranularity = "module",
            importPrefix = "self",
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
      }
    }
  }

  nvim_lsp.graphql.setup {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    handlers = handlers,
    capabilities = capabilities,
  }

  nvim_lsp.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    },
    handlers = handlers,
    capabilities = capabilities,
  }

  nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
  }

  local util = require('lspconfig/util')

  nvim_lsp.gopls.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    cmd = { 'gopls', 'serve' },
    filetypes = { 'go', 'gomod', 'gotmpl' },
    root_dir = function (fname)
      return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
    end,
    single_file_support = true,
  }

  nvim_lsp.pyright.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or util.path.dirname(fname)
    end,
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    single_file_support = true,
  }

  nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    single_file_support = true,
    handlers = handlers,
    on_attach = function(client, bufnr)
      -- disable tsserver formatting if you plan on formatting via null-ls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require('nvim-lsp-ts-utils')
      -- defaults
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        -- lower numbers indicate higher priority
        import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = 'eslint_d',
        eslint_enable_diagnostics = true,
        eslint_opts = {
          diagnostics_format = '#{m} [#{c}]',
        },

        -- formatting
        enable_formatting = false,
        formatter = 'prettier',
        formatter_opts = {},

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = true,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        -- filter out dumb module warning
        filter_out_diagnostics_by_code = { 80001 },
        flags = {
          debounce_text_changes = 150,
        },
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      on_attach(client, bufnr)
    end,

    flags = {debounce_text_changes = 150}
  }



  -- sumneko lua ls
  USER = vim.fn.expand('$USER')

  local sumneko_root_path = '/Users/' .. USER .. '/.config/nvim/lua-language-server'
  local sumneko_binary = '/Users/' .. USER .. '/.config/nvim/lua-language-server/bin/macOS/lua-language-server'

  if vim.fn.has('mac') ~= 1 or vim.fn.has('unix') ~= 1 then
   print('Unsupported system for sumneko')
  end

  -- Make runtime files discoverable to the server
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    settings = {
     Lua = {
       runtime = {
         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
         version = 'LuaJIT',
         -- Setup your lua path
         path = runtime_path,
       },
       diagnostics = {
         -- Get the language server to recognize the `vim` global
         enable = true,
         globals = { 'vim' },
       },
       workspace = {
         -- Make the server aware of Neovim runtime files
         library = vim.api.nvim_get_runtime_file('', true),
         maxPreload = 10000, -- Add this if missing or increase it
         preloadFileSize = 10000, -- Add this if missing or increase it
         checkThirdParty = false,
       },
       -- Do not send telemetry data containing a randomized but unique identifier
       telemetry = {
         enable = false,
       },
     },
    },
    handlers = handlers,
    flags = {
     debounce_text_changes = 150,
    },
  }
end

return M

