local settings = require("settings")
local colors = require("colors")
local app_icons = require("icon_map")

local item_order = ""

function Update_windows(space, space_name)
  sbar.exec("aerospace list-windows --format %{app-name} --workspace " .. space_name, function(windows)
    print(windows)
    local no_app = true
    local icon_line = ""
    for app in windows:gmatch("[^\r\n]+") do
      no_app = false
      local lookup = app_icons[app]
      local icon = ((lookup == nil) and app_icons["Default"] or lookup)
      icon_line = icon_line .. " " .. icon
    end
    if no_app then
      icon_line = " —"
    end
    sbar.animate("tanh", 10, function()
      space:set({ label = icon_line })
    end)
  end)
end

function Update_workspaces(env, space, space_name, space_bracket, debug)
  local selected = env.FOCUSED_WORKSPACE == space_name
  -- local color = selected and settings.default_colors.icons or colors.bar.bg
  if debug then
    print("workspace: |" .. env.FOCUSED_WORKSPACE .. "|")
    print(selected, space_name)
  end
  space:set({
    icon = { highlight = selected },
    label = { highlight = selected },
    -- background = { border_color = selected and colors.red or colors.white },
  })
  space_bracket:set({
    background = { border_color = settings.default_colors.icons.selected },
  })
end

sbar.exec("aerospace list-workspaces --focused", function(result)
  sbar.exec("aerospace list-workspaces --all", function(spaces)
    for space_name in spaces:gmatch("[^\r\n]+") do
      if space_name ~= ".scratchpad" then
        local space = sbar.add("item", "space." .. space_name, {
          icon = {
            string = space_name,
            padding_left = 7,
            padding_right = 3,
            color = settings.default_colors.text.idle,
            highlight_color = settings.default_colors.icons.selected,
          },
          label = {
            padding_right = 12,
            color = settings.default_colors.text.idle,
            highlight_color = settings.default_colors.icons.selected,
            font = "sketchybar-app-font:Regular:16.0",
            y_offset = -1,
          },
          padding_right = 1,
          padding_left = 1,
          background = {
            border_width = 1,
            height = 26,
          },
        })
        local space_bracket = sbar.add("bracket", { space.name }, {
          background = {
            color = colors.transparent,
            height = 24,
            border_width = 2,
          },
        })
        -- Padding space
        local space_padding = sbar.add("item", "space.padding." .. space_name, {
          script = "",
          width = settings.paddings.inner,
          background = {
            drawing = false
          }
        })

        space:subscribe("aerospace_workspace_change", function(env)
          Update_workspaces(env, space, space_name, space_bracket, false)
          Update_windows(space, space_name)
        end)
        result = result:gsub("\n[^\n]*(\n?)$", "%1")
        Update_workspaces({ FOCUSED_WORKSPACE = result }, space, space_name, space_bracket, true)

        space:subscribe("mouse.clicked", function()
          sbar.exec("aerospace workspace " .. space_name)
        end)

        space:subscribe({ "space_windows_change" }, function()
          Update_windows(space, space_name)
        end)
        Update_windows(space, space_name)


        item_order = item_order .. " " .. space.name .. " " .. space_padding.name
      end
    end
    sbar.exec("sketchybar --reorder apple " .. item_order)
  end)
end)
