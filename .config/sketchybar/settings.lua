local colors = require("colors")
return {
  font = "Arimo Nerd Font",
  paddings = {
    inner = 7,
    outer = 10,
    item_padding = 6
  },
  default_colors = {
    hover = colors.white,
    icons = {
      idle = colors.red,
      warn = colors.red,
      critical = colors.red,
      selected = colors.red,
      hover = colors.black,
    },
    text = {
      idle = colors.white,
      critical = colors.red,
      selected = colors.red,
      hover = colors.black,
    },
    border = colors.red
  },
}
