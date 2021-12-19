local M = {}

M.config = function()
  local status_ok, null_ls = pcall(require, 'null-ls')

  if not status_ok then
    return
  end

  local builtins = null_ls.builtins

  local sources = {
    builtins.diagnostics.eslint_d,
    builtins.code_actions.eslint_d,
    builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

    builtins.formatting.black.with({ extra_args = { "--fast" } }),
    builtins.formatting.stylua,
  }

  null_ls.setup({
    debug = false,
    sources
  })
end

return M

