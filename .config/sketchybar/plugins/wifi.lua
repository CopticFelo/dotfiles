local settings = require("settings")
local isHovered = false
local wifi = sbar.add("item", {
	position = "right",
	label = {
		string = "Nicht verbunden",
	},
	icon = {
		string = "󰖩",
		color = settings.default_colors.icons.critical,
	},
	update_freq = 2,
})

local function update(res)
	local icon_color = settings.default_colors.icons.idle
	if not isHovered then
		icon_color = res == "" and settings.default_colors.icons.critical or settings.default_colors.icons.idle
	else
		icon_color = settings.default_colors.icons.hover
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
		[[ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}']],
		function(res)
			update(res)
		end
	)
end)

wifi:subscribe("mouse.entered", function()
	isHovered = true
	wifi:set({
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

wifi:subscribe("mouse.exited", function()
	isHovered = false
	wifi:set({
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
	sbar.exec(
		[[ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}']],
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
