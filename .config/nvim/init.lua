require("felo.core.options")
require("felo.core.keymaps")
require("felo.lazy")
require("nvim-tree").setup()

vim.cmd('autocmd CmdlineLeave * redrawstatus')
vim.api.nvim_exec ('language en_US', true)
