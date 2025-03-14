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
