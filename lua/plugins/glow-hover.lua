return function()
  local status_ok, glow_hover = pcall(require, 'glow-hover')

  if not status_ok then
    return
  end

  glow_hover.setup({
    -- The followings are the default values
    max_width = 120,
    padding = 1,
    border = 'rounded',
    glow_path = 'glow',
  })
end

