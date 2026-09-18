local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>A",
  "<Cmd>XcodebuildCodeActions<CR>",
  { silent = true, buffer = bufnr }
)
-- vim.keymap.set(
--   "n",
--   "K",
--   "<Cmd>XcodebuildCodeActions<CR>",
--   { silent = true, buffer = bufnr }
-- )
vim.keymap.set(
  "n",
  "<F1>",
  "<Cmd>XcodebuildPicker<CR>",
  { silent = true, buffer = bufnr }
)
