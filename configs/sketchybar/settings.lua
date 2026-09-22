local colors = {
  accent = 0xff00ff00,
  idle = 0xffdbdbdb,
  warn = 0xffffb000,
  critical = 0xffFF0000,
  selected = 0xff00ffff,
  hover = 0xffffffff,
  bg = 0x00242121,
  clear = 0x0,

  bar = {
    bg = 0x1f433f3c,
    border = 0xa6ffffff,
  },
}

return {
  font = "AurulentSansM Nerd Font",
  paddings = {
    inner = 7,
    outer = 10,
    item_padding = 6
  },
  colors = {
    bar = {
      bg = colors.bar.bg,
      border = colors.bar.border
    },
    bg = colors.bg,
    hover = colors.accent,
    icons = {
      idle = colors.accent,
      warn = colors.warn,
      critical = colors.critical,
      selected = colors.selected,
      hover = colors.selected,
    },
    text = {
      idle = colors.idle,
      critical = colors.critical,
      selected = colors.selected,
      hover = colors.accent,
    },
    border = colors.clear
  },
}
