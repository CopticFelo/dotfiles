paneru.setup {
  default_workspaces = 6,
  options = {
    focus_follows_mouse = false,
    animation_speed = 50.0,
    menubar_height = 30,
    mouse_resize_modifier = "cmd + shift",
    preset_column_widths = { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0 },
    reap_empty_workspaces = false
  },
  padding = { top = 5, bottom = 5, left = 1, right = 1 },
  swipe = {
    sensitivity = 0.35,
    continuous = false,
    gesture = {
      fingers_count = 3,
      vertical = true,
    }
  },
  restore = { enabled = true, startup_grace_ms = 2000 },
  bindings = {
    ["window focus east"] = "alt - l",
    ["window focus west"] = "alt - h",
    ["window grow"] = "alt - =",
    ["window shrink"] = "alt - minus",
    ["window fullwidth"] = "alt - f",
    ["window center"] = "alt - c",
    ["window manage"] = "alt - space",
    ["window raise floating"] = "alt + shift - s",
    ["window swap east"] = "alt + shift - l",
    ["window swap west"] = "alt + shift - h",
    ["quit"] = "ctrl + alt - q",
  }
}

function update_sketchybar(num)
  os.execute("/opt/homebrew/bin/sketchybar --trigger space_changed SPACE=" .. num)
end

paneru.bind("alt - 1", function(ws)
  update_sketchybar(1)
  return ws:view(1)
end)
paneru.bind("alt - 2", function(ws)
  update_sketchybar(2)
  return ws:view(2)
end)
paneru.bind("alt - 3", function(ws)
  update_sketchybar(3)
  return ws:view(3)
end)
paneru.bind("alt - 4", function(ws)
  update_sketchybar(4)
  return ws:view(4)
end)
paneru.bind("alt - 5", function(ws)
  update_sketchybar(5)
  return ws:view(5)
end)
paneru.bind("alt - 6", function(ws)
  update_sketchybar(6)
  return ws:view(6)
end)

paneru.bind("alt + shift - 1", function(ws)
  update_sketchybar(1)
  return ws:shift(ws:focused(), 1, true)
end)
paneru.bind("alt + shift - 2", function(ws)
  update_sketchybar(2)
  return ws:shift(ws:focused(), 2, true)
end)
paneru.bind("alt + shift - 3", function(ws)
  update_sketchybar(3)
  return ws:shift(ws:focused(), 3, true)
end)
paneru.bind("alt + shift - 4", function(ws)
  update_sketchybar(4)
  return ws:shift(ws:focused(), 4, true)
end)
paneru.bind("alt + shift - 5", function(ws)
  update_sketchybar(5)
  return ws:shift(ws:focused(), 5, true)
end)
paneru.bind("alt + shift - 6", function(ws)
  update_sketchybar(6)
  return ws:shift(ws:focused(), 6, true)
end)

paneru.on("window_focused", function(event, ws)
  update_sketchybar(ws:current())
end)
paneru.on("vertical_swipe", function(event, ws)
  update_sketchybar(ws:current())
end)
