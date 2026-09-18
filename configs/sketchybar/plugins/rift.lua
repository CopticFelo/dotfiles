local settings = require("settings")
local app_icons = require("icon_map")

local item_order = ""

sbar.exec("rift-cli query workspaces | jq -r '.'", function(workspaces)
  print(workspaces)
  for _, workspace in pairs(workspaces) do
    local space_name = workspace['name']
    local is_active = workspace['is_active']
    local space = sbar.add("item", "space." .. space_name, {
      icon = {
        font = { family = settings.font },
        string = is_active and "" or "",
        padding_left = 7,
        padding_right = 3,
        color = settings.colors.icons.selected,
        highlight_color = settings.colors.icons.idle,
        highlight = workspace['is_active']
      },
      padding_right = 1,
      padding_left = 1,
    })


    space:subscribe("rift_workspace_change", function(env)
      print("trigger rift")
      print(env.RIFT_WORKSPACE_NAME)
      local selected = env.RIFT_WORKSPACE_NAME == space_name
      print(space_name)
      print(selected)
      space:set({
        icon = {
          highlight = selected,
          string = selected and "" or ""
        }
      })
    end)

    space:subscribe("mouse.clicked", function()
      sbar.exec("aerospace workspace " .. space_name)
    end)
    item_order = item_order .. " space." .. space_name
    print(item_order)
    if i == 5 then
      sbar.exec("sketchybar --reorder apple " .. item_order)
    end
  end
end)
