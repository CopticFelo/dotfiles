require("felo.core.options")
require("felo.core.keymaps")
require("felo.lazy")
require("nvim-tree").setup()

vim.cmd("autocmd CmdlineLeave * redrawstatus")
-- vim.api.nvim_exec ('language en_US', true)
vim.cmd([[language en_US.UTF-8]])
vim.api.nvim_create_augroup("TerminalResize", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	group = "TerminalResize",
	command = "resize 15",
})
vim.cmd("colorscheme midnight")
