local M = {}

M.config = function()
  local status_ok, null_ls = pcall(require, 'null-ls')

  if not status_ok then
    return
  end

  null_ls.config{
    sources = {
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file(".eslintrc.json")
        end,
      }),
    }
  }

  require('lspconfig')['null-ls'].setup{}
end


return M
