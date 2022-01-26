local M = {}

M.config = function()
  local status_ok, null_ls = pcall(require, 'null-ls')

  if not status_ok then
    return
  end

  local builtins = null_ls.builtins

  null_ls.setup({
    debug = false,
    sources = {
      builtins.diagnostics.eslint_d,
      builtins.code_actions.eslint_d,
      builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    }
  })
end

return M

