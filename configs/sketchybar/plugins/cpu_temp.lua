local settings = require("settings")
local cpu_temp = sbar.add("item", {
  position = "right",
  icon = {
    string = "󰦖",
  },
  label = {
    string = "...",
  },
  update_freq = 2,
})

cpu_temp:subscribe("routine", function()
  local color = settings.colors.icons.idle
  sbar.exec("/opt/homebrew/bin/smctemp -c", function(percent)
    local tempicon = "󰦖"
    -- percent? i am sorry, what?
    -- TODO: change that variable name
    local percentnum = tonumber(percent)
    if percentnum >= 85 then
      tempicon = ""
      color = settings.colors.icons.critical
    elseif percentnum >= 60 then
      tempicon = ""
      color = settings.colors.icons.warn
    else
      tempicon = ""
      color = settings.colors.icons.idle
    end
    cpu_temp:set({
      icon = {
        string = tempicon,
        color = color,
      },
      label = {
        string = string.sub(percent, 1, 2) .. "°c",
        color = percentnum > 90 and settings.colors.text.critical or settings.colors.text.idle,
      },
    })
  end)
end)
