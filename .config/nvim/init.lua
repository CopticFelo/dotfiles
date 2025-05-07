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

vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd", "asm_lsp", "basedpyright" })
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
