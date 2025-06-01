require("felo.core.options")
require("felo.core.keymaps")
require("felo.lazy")
require("nvim-tree").setup()

vim.cmd("autocmd CmdlineLeave * redrawstatus")
-- vim.api.nvim_exec ('language en_US', true)
vim.cmd([[language de_DE.UTF-8]])
vim.api.nvim_create_augroup("TerminalResize", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = "TerminalResize",
  command = "resize 15",
})

vim.cmd("colorscheme oxocarbon")
vim.o.guifont = "JetbrainsMono Nerd Font:h17"
vim.g.neovide_opacity = 0.6
vim.g.neovide_normal_opacity = 0.6
vim.g.neovide_show_border = true
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = false
vim.g.neovide_cursor_trail_size = 0.0
vim.o.winborder = "single"
vim.o.equalalways = false

vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd", "asm_lsp", "basedpyright", "sourcekit" })
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
