return function()
  local status_ok, material = pcall(require, "material")
  if not status_ok then
    return
  end

  material.setup {
    high_visibility = {
      darker = true,
      deep_ocean = true
    },

    lualine_style = "default",

    contrast = {
      sidebars = true,
      cursor_line = true,
    },

    italics = {
      comments = true,
      functions = true,
    },

    contrast_filetypes = {
      "terminal",
      "packer",
      "qf",
    }
  }
end
