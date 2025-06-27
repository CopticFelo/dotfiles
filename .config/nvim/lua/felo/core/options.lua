-- Appearance
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.o.winborder = "single"
vim.opt.title = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true
vim.o.guifont = "JetbrainsMono Nerd Font:h17"
vim.cmd("colorscheme gabriel")
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci:block-iCursor"

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.inccommand = "split"
vim.opt.mouse = "a"

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Split Windows
vim.opt.splitright = true
vim.o.equalalways = false

-- Tab Settings
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- LSP
vim.lsp.enable("sourcekit")
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

-- Neovide
vim.g.neovide_opacity = 0.6
vim.g.neovide_normal_opacity = 0.6
vim.g.neovide_show_border = true
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = false
vim.g.neovide_cursor_trail_size = 0.0

-- Other
vim.opt.wrap = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("highlight Cursor guifg=NONE guibg=#00D7FF")
vim.cmd("highlight iCursor guifg=NONE guibg=#FF5F5F")
vim.cmd("autocmd CmdlineLeave * redrawstatus")
vim.cmd([[language de_DE.UTF-8]])
vim.api.nvim_create_augroup("TerminalResize", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = "TerminalResize",
  command = "resize 15",
})
