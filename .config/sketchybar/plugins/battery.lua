local colors = require("colors")
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
	local color = colors.white
	local percentnum = nil
	sbar.exec([[pmset -g batt | grep -Eo "\d+%" | cut -d% -f1]], function(percent)
		sbar.exec([[pmset -g batt | grep 'AC Power']], function(status)
			percentnum = tonumber(percent)
			if percentnum >= 75 then
				baticon = ""
				color = colors.green
				isVisible = true
			elseif percentnum >= 50 then
				baticon = ""
				color = colors.yellow
				isVisible = true
			elseif percentnum >= 25 then
				baticon = ""
				color = colors.orange
				isVisible = true
			elseif percentnum > 10 then
				baticon = ""
				color = colors.red
				isVisible = true
			else
				baticon = ""
				color = colors.red
				isVisible = not isVisible
			end
			if status ~= "" then
				baticon = "󱐋"
				color = colors.green
				isVisible = true
			end
			battery:set({
				icon = {
					string = isVisible and baticon or " ",
					color = color,
				},
				label = {
					string = tostring(percentnum) .. "%",
					color = (percentnum <= 10) and color or colors.white,
				},
			})
		end)
	end)
end)
