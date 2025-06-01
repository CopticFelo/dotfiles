local colors = require("colors")
local settings = require("settings")

local menu_watcher = sbar.add("item", {
  drawing = false,
  -- updates = false,
})
local space_menu_swap = sbar.add("item", {
  drawing = false,
  updates = true,
})
sbar.add("event", "swap_menus_and_spaces")

local max_items = 10
local menu_items = {}
for i = 1, max_items, 1 do
  local menu = sbar.add("item", "menu." .. i, {
    padding_left = settings.paddings.outer,
    padding_right = settings.paddings.inner - 4,
    drawing = false,
    icon = { drawing = false },
    label = {
      padding_left = 6,
      padding_right = 6,
    },
    click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s " .. i,
  })

  menu:subscribe("mouse.entered", function()
    menu:set({
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

  menu:subscribe("mouse.exited", function()
    menu:set({
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

  menu_items[i] = menu
end

sbar.add("bracket", "brkt", { '/menu\\..*/' }, {
  background = { color = colors.bg1 }
})

local menu_padding = sbar.add("item", "menu.padding", {
  drawing = false,
  width = 5
})

local function update_menus(env)
  print("menus: ")
  sbar.exec("$CONFIG_DIR/helpers/menus/bin/menus -l", function(menus)
    print(menus)
    sbar.set('/menu\\..*/', { drawing = false })
    menu_padding:set({ drawing = true })
    id = 1
    for menu in string.gmatch(menus, '[^\r\n]+') do
      if id < max_items then
        menu_items[id]:set({ label = menu, drawing = true })
      else
        break
      end
      id = id + 1
    end
  end)
end

menu_watcher:subscribe({ "front_app_switched", "space_windows_change", "space_change" }, update_menus)

-- local tst = sbar.add("item", "test", { drawing = false })
-- print(menu_watcher)
-- tst:subscribe("front_app_switched", update_menus)

space_menu_swap:subscribe("swap_menus_and_spaces", function(env)
  local drawing = menu_items[1]:query().geometry.drawing == "on"
  if drawing then
    menu_watcher:set({ updates = false })
    sbar.set("/menu\\..*/", { drawing = false })
    sbar.set("/space\\..*/", { drawing = true })
    sbar.set("front_app", { drawing = true })
  else
    menu_watcher:set({ updates = true })
    sbar.set("/space\\..*/", { drawing = false })
    sbar.set("front_app", { drawing = false })
    update_menus()
  end
end)

return menu_watcher
