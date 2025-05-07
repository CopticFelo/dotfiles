return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      mru_sort = true,
    })
  end
}
