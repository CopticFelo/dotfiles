local settings = require("settings")
local isHovered = false
local wifi = sbar.add("item", {
  position = "right",
  label = {
    string = "Nicht verbunden",
  },
  icon = {
    string = "󰖩",
    color = settings.colors.icons.critical,
  },
  update_freq = 5,
})

local function update(res)
  local icon_color = settings.colors.icons.idle
  if not isHovered then
    icon_color = res == "" and settings.colors.icons.critical or settings.colors.icons.idle
  else
    icon_color = settings.colors.icons.hover
  end
  wifi:set({
    label = {
      string = res == "" and "Nicht verbunden" or res,
    },
    icon = {
      color = icon_color,
    },
  })
end

wifi:subscribe("routine", function()
  sbar.exec(
    [[en="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')"; ipconfig getsummary "$en" | grep -Fxq "  Active : FALSE" || networksetup -listpreferredwirelessnetworks "$en" | sed -n '2s/^\t//p']],
    function(res)
      update(res)
    end
  )
end)

wifi:subscribe("mouse.entered", function()
  isHovered = true
  wifi:set({
    background = {
      color = settings.colors.hover,
    },
    label = {
      color = settings.colors.text.hover,
    },
    icon = {
      color = settings.colors.icons.hover,
    },
  })
end)

wifi:subscribe("mouse.exited", function()
  isHovered = false
  wifi:set({
    background = {
      color = settings.colors.bg,
    },
    label = {
      color = settings.colors.text.idle,
    },
    icon = {
      color = settings.colors.icons.idle,
    },
  })
  sbar.exec(
    [[en="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')"; ipconfig getsummary "$en" | grep -Fxq "  Active : FALSE" || networksetup -listpreferredwirelessnetworks "$en" | sed -n '2s/^\t//p']],
    function(res)
      update(res)
    end
  )
end)

wifi:subscribe("mouse.clicked", function()
  sbar.exec("networksetup -getairportpower en0", function(res)
    if string.sub(res, -3) == "On\n" then
      sbar.exec("networksetup -setairportpower en0 off")
      update("")
    else
      sbar.exec("networksetup -setairportpower en0 on")
    end
  end)
end)
