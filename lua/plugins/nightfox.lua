return function()
  local status_ok, nightfox = pcall(require, 'nightfox')

  if not status_ok then
    return
  end

  nightfox.setup {
    fox = 'nightfox',
    styles = {
      comments = 'italic', -- Style that is applied to comments: see `highlight-args` for options
      functions = 'NONE', -- Style that is applied to functions: see `highlight-args` for options
      keywords = 'NONE', -- Style that is applied to keywords: see `highlight-args` for options
      strings = 'NONE', -- Style that is applied to strings: see `highlight-args` for options
      variables = 'NONE', -- Style that is applied to variables: see `highlight-args` for options
    },
  }

  nightfox.load()
end
