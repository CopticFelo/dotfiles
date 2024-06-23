vim.g.mapleader = ";"

vim.keymap.set("n", "<leader>j", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv") -- move line down(v)

vim.keymap.set("n", "<leader>w", "yyP") -- duplicate line up(n)
vim.keymap.set("n", "<leader>s", "yyp") -- duplicate line down(n)
vim.keymap.set("v", "<leader>w", "y'>pgv") -- duplicate line up(v)
vim.keymap.set("v", "<leader>s", "yPgv") -- duplicate line down(v)

vim.keymap.set("n", "<leader>n", ":nohl<CR>") -- clear search highlights

vim.keymap.set("n", "<leader>c", ":NvimTreeToggle<CR>") -- Toggle Nvim Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>") -- Focus Nvim Tree
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>") -- Focus Nvim Tree

vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>") -- New tab
vim.keymap.set("n", "<leader>q", "<cmd>tabclose<CR>") -- Close tab
vim.keymap.set("n", "<leader>,", "<cmd>tabn<CR>") -- Next tab
vim.keymap.set("n", "<leader>.", "<cmd>tabp<CR>") -- Prev tab

vim.keymap.set("n", "<leader><leader>", "daw") -- Delete word

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>") -- Find

vim.keymap.set("n", "<leader>v", "<C-w>v") -- Split vertically
vim.keymap.set("n", "<leader>h", "<C-w>s") -- Split horizontally
vim.keymap.set("n", "<leader>x", ":close<CR>") -- Close split

vim.keymap.set("n", "<leader>z", "<C-w>s<cmd>TmuxNavigateDown<CR><cmd>terminal<CR>i")
