local settings = require("settings")

sbar.bar({
  position = "top",
  height = 30,
  blur_radius = 20,
  color = settings.colors.bar.bg,
  border_color = 0x0,
  corner_radius = 0,
  sticky = true,
  -- y_offset = 2,
  -- what.....
  margin = -12,
})
