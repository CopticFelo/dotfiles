local colors = require("colors")
local wifi = sbar.add("item", {
	position = "right",
	label = {
		string = "Nicht verbunden",
	},
	icon = {
		string = "󰖩",
		color = colors.red,
	},
	update_freq = 2,
})

local function update(res)
	wifi:set({
		label = {
			string = res == "" and "Nicht verbunden" or res,
		},
		icon = {
			color = res == "" and colors.red or colors.green,
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
	wifi:set({
		background = {
			drawing = "on",
			color = colors.white,
		},
		label = {
			color = colors.black,
		},
		icon = {
			color = colors.black,
		},
	})
end)

wifi:subscribe("mouse.exited", function()
	wifi:set({
		background = {
			drawing = "off",
		},
		label = {
			color = colors.white,
		},
		icon = {
			color = colors.white,
		},
	})
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
