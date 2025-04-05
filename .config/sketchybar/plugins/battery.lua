local settings = require("settings")
local isVisible = false
local battery = sbar.add("item", {
	position = "right",
	icon = {
		width = 24,
		align = "center",
	},
	label = {
		align = "center",
	},
	update_freq = 1,
})

battery:subscribe("routine", function()
	local baticon = ""
	local color = settings.default_colors.icons.idle
	local percentnum = nil
	sbar.exec([[pmset -g batt | grep -Eo "\d+%" | cut -d% -f1]], function(percent)
		sbar.exec([[pmset -g batt | grep 'AC Power']], function(status)
			percentnum = tonumber(percent)
			if percentnum >= 75 then
				baticon = ""
				color = settings.default_colors.icons.idle
				isVisible = true
			elseif percentnum >= 50 then
				baticon = ""
				color = settings.default_colors.icons.idle
				isVisible = true
			elseif percentnum >= 20 then
				baticon = ""
				color = settings.default_colors.icons.idle
				isVisible = true
			elseif percentnum > 10 then
				baticon = ""
				color = settings.default_colors.icons.critical
				isVisible = true
			else
				baticon = ""
				color = settings.default_colors.icons.critical
				isVisible = not isVisible
			end
			if status ~= "" then
				baticon = "󱐋"
				color = settings.default_colors.icons.idle
				isVisible = true
			end
			battery:set({
				icon = {
					string = isVisible and baticon or " ",
					color = color,
				},
				label = {
					string = tostring(percentnum) .. "%",
					color = (percentnum <= 10) and settings.default_colors.text.critical
						or settings.default_colors.text.idle,
				},
			})
		end)
	end)
end)
