local colors = require("colors")
local music = sbar.add("item", {
	position = "left",
	update_freq = 3,
	scroll_texts = true,
	label = {
		max_chars = 30,
	},
})

music:subscribe("routine", function()
	sbar.exec("nowplaying-cli get title playbackRate", function(result)
		local result_fmt = {}
		for s in result:gmatch("([^\n]*)\n?") do
			table.insert(result_fmt, s)
		end
		local isPlaying = (string.sub(result_fmt[1], 1, 4) ~= "null")
		local isPaused = (tonumber(result_fmt[2]) == 0)
		-- if (len(result) > 20) then
		--
		-- end
		music:set({
			label = {
				string = isPlaying and result_fmt[1] or "",
			},
			icon = {
				string = isPlaying and "" or "",
				color = isPaused and colors.red or colors.white,
			},
		})
	end)
end)

music:subscribe("mouse.clicked", function()
	sbar.exec("nowplaying-cli get playbackRate", function(result)
		local isPaused = (tonumber(result) == 0)
		if isPaused then
			music:set({
				icon = {
					color = colors.green,
				},
			})
			sbar.exec("nowplaying-cli play", function() end)
		else
			music:set({
				icon = {
					color = colors.red,
				},
			})
			sbar.exec("nowplaying-cli pause", function() end)
		end
	end)
end)
