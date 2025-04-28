local settings = require("settings")

local outdated = sbar.add("item", {
	drawing = false,
	position = "right",
	background = {
		drawing = "off",
	},
	update_freq = 1800,
})

local function update()
	sbar.exec("/opt/homebrew/bin/brew outdated | wc -l", function(result)
		local count = tonumber(result)
		print(count)
		if count == nil or count == 0 then
			outdated:set({
				drawing = false,
			})
			return
		end
		outdated:set({
			drawing = true,
			label = {
				string = count,
			},
			icon = {
				string = "",
			},
		})
	end)
end

-- local updated_event = sbar.add("event", "brew_updated")

-- outdated:subscribe("brew_updated", function(result)
-- 	print(result)
-- 	if ext == 0 then
-- 		sbar.exec(
-- 			[[osascript -e 'display notification "Brew Packungungen wurde erfolgreich aktualisiert" with title "Brew"']],
-- 			function(result)
-- 				update()
-- 			end
-- 		)
-- 	else
-- 		sbar.exec(
-- 			[[osascript -e 'display notification "Brew Packungungen wurde erfolglos aktualisiert" with title "Brew"']]
-- 		)
-- 	end
-- end)

outdated:subscribe("routine", function()
	update()
end)

outdated:subscribe("mouse.entered", function()
	outdated:set({
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

outdated:subscribe("mouse.exited", function()
	outdated:set({
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

outdated:subscribe("mouse.clicked", function(env)
	update()
end)

update()
