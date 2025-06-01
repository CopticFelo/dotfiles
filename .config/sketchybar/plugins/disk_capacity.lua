local settings = require("settings")
local cap_monitor = sbar.add("item", {
  position = "right",
  icon = {
    string = "󰦖",
  },
  label = {
    string = "...",
  },
  update_freq = 2,
})

cap_monitor:subscribe({ "routine" }, function()
  sbar.exec(
    "df -k /System/Volumes/Data | awk 'END {print $4}' && df -H /System/Volumes/Data | awk 'END {print $5}' | sed 's/%//'",
    function(result)
      local result_fmt = {}
      for s in result:gmatch("([^\n]*)\n?") do
        table.insert(result_fmt, s)
      end

      local gigabytes = math.floor((tonumber(result_fmt[1]) / 1024 / 1024) * 10) / 10

      local icn = "󰪥"
      result_fmt[2] = tonumber(result_fmt[2])
      if result_fmt[2] < 25 then
        icn = "󰪞"
      elseif result_fmt[2] < 40 then
        icn = "󰪟"
      elseif result_fmt[2] < 50 then
        icn = "󰪠"
      elseif result_fmt[2] < 65 then
        icn = "󰪡"
      elseif result_fmt[2] < 75 then
        icn = "󰪢"
      elseif result_fmt[2] < 85 then
        icn = "󰪣"
      elseif result_fmt[2] < 98 then
        icn = "󰪤"
      else
        icn = "󰪥"
      end

      cap_monitor:set({
        icon = {
          string = icn,
          color = gigabytes < 1 and settings.default_colors.icons.critical or
              settings.default_colors.icons.idle
        },
        label = {
          string = tostring(gigabytes) .. "G",
        }
      })
    end)
end)
