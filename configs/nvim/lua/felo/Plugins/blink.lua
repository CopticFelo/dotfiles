return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip', 'onsails/lspkind-nvim', 'echasnovski/mini.icons' },
  version = '1.*',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 1500
      },
      menu = {
        border = "rounded",
        max_width = 220,
        draw = {
          gap = 2,
          components = {
            kind_icon = {
              ellipsis = false,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
              text = function(ctx)
                local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                return icon .. ctx.icon_gap
              end,
            },
            label = {
              width = { fill = false, max = 120 },
            },
          },
        },
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
    },
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = "super-tab",
    },
    fuzzy = { implementation = "prefer_rust" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
