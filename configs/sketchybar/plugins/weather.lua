local settings = require("settings")
local location_str = ""
sbar.exec("scripts/get_weather_location.sh", function(result)
  location_str = result
end)

local weather_icons_day = {
  [0] = '',
  [1] = '',
  [2] = '',
  [3] = '',
  [45] = '',
  [48] = '',
  [51] = '',
  [53] = '',
  [55] = '󰖗',
  [56] = '',
  [57] = '󰙿',
  [61] = '',
  [63] = '',
  [65] = '',
  [66] = '󰙿',
  [67] = '󰙿',
  [71] = '',
  [73] = '',
  [75] = '󰖘',
  [80] = '',
  [81] = '',
  [82] = '',
  [85] = '󰼶',
  [86] = '󰼶',
  [95] = '',
  [96] = '󰙾',
  [99] = '󰙾',
}

local weather_icons_night = {
  [0] = '',
  [1] = '',
  [2] = '',
  [3] = '',
  [45] = '',
  [48] = '',
  [51] = '',
  [53] = '',
  [55] = '󰖗',
  [56] = '',
  [57] = '󰙿',
  [61] = '',
  [63] = '',
  [65] = '',
  [66] = '󰙿',
  [67] = '󰙿',
  [71] = '',
  [73] = '',
  [75] = '󰖘',
  [77] = '',
  [80] = '',
  [81] = '',
  [82] = '',
  [85] = '󰼶',
  [95] = '',
  [96] = '󰙾',
  [99] = '󰙾',
}

local weather = sbar.add("item", "widgets.weather", {
  position = "right",
  update_freq = 1800,
})

local function get_icon(condition, is_day)
  if is_day == 1 then
    return weather_icons_day[condition] or condition
  else
    return weather_icons_night[condition] or condition
  end
end

weather:subscribe({ "forced", "routine", "system_woke", "wifi_change", "mouse.clicked" }, function(env)
  local url = string.format(
    "curl -s 'https://api.open-meteo.com/v1/forecast?%s&current=temperature_2m,weather_code,is_day&forecast_days=1'",
    location_str)
  print(url)
  sbar.exec(url, function(data)
    local icon = get_icon(data.current.weather_code, data.current.is_day)
    weather:set({
      icon = {
        string = icon,
      },
      label = {
        string = string.format("%s°C", data.current.temperature_2m),
      },
    })
  end)
end)

weather:subscribe("mouse.entered", function()
  weather:set({
    background = {
      drawing = "on",
      color = settings.default_colors.hover,
    },
    label = {
      color = settings.default_colors.text.hover,
    },
    icon = {
      color = settings.default_colors.icons.hover,
    },
  })
end)

weather:subscribe("mouse.exited", function()
  weather:set({
    background = {
      drawing = "off",
    },
    label = {
      color = settings.default_colors.text.idle,
    },
    icon = {
      color = settings.default_colors.icons.idle,
    },
  })
end)
