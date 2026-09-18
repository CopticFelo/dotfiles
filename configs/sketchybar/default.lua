local settings = require("settings")

sbar.default({
  padding_left = settings.paddings.item_padding,
  padding_right = settings.paddings.item_padding,
  icon = {
    font = {
      family = settings.font,
      style = "Bold",
      size = 15,
    },
    color = settings.colors.icons.idle,
    padding_left = settings.paddings.outer,
  },
  label = {
    font = {
      family = settings.font,
      -- style = "Bold",
      size = 15.0,
    },
    color = settings.colors.text.idle,
    padding_left = settings.paddings.inner,
    padding_right = settings.paddings.outer,
  },
  background = {
    color = settings.colors.bg,
    height = 28,
    corner_radius = 9,
    border_color = settings.colors.border,
    border_width = 2,
    padding_left = settings.paddings.item_padding,
    padding_right = settings.paddings.item_padding,
  },
})
