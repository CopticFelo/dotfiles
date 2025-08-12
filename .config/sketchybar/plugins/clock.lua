local settings = require("settings")
local clock = sbar.add("item", {
  position = "right",
  icon = {
    string = "",
  },
  update_freq = 1,
  label = {
    drawing = true,
  },
  background = {
    padding_right = 0
  }
})

local function update()
  sbar.exec("date '+%a %b %d  %-I:%M %p'", function(result, exit)
    local result_fmt = {}
    for t in result:gmatch("%S+") do
      table.insert(result_fmt, t)
    end
    local hour = tonumber(string.sub(result_fmt[4], 1, 1))
    local ampm = result_fmt[5]
    local color = settings.default_colors.icons.idle
    if (hour < 5 or hour == 12) and (ampm == "AM") then
      color = settings.default_colors.icons.critical
    end
    clock:set({
      label = {
        string = result,
      },
      icon = {
        color = color,
      },
    })
  end)
end

clock:subscribe("routine", update)
