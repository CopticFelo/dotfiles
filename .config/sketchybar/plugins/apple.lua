local settings = require("settings")
local apple = sbar.add("item", {
  icon = {
    string = "",
    color = settings.default_colors.icons.idle,
    font = {
      size = 19,
    },
  },
  padding_right = settings.paddings.outer,
  padding_left = settings.paddings.inner,
  background = {
    padding_left = 0,
  }
})
