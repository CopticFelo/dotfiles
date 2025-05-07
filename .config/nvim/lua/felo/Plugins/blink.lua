return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = {
      preset = "super-tab",
      ['K'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    fuzzy = { implementation = "prefer_rust" },
  },
}
