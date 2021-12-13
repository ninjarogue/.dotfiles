local M = {}

M.config = function()
  local status_ok, nightfox = pcall(require, 'nightfox')

  if not status_ok then
    return
  end

  nightfox.setup{
    styles = {
      comments = 'italic',
      keywords = 'bold',
      functions = 'italic,bold'
    }
  }

  nightfox.load()
end

return M

