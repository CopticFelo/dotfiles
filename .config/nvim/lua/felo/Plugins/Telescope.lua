return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
      "nvim-tree/nvim-web-devicons" 
    },
    config = function()
      local ts = require("telescope")
      local actions = require("telescope.actions")
      ts.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            n = {
              ["<down>"] = actions.move_selection_next,
              ["<up>"] = actions.move_selection_previous,
            }
          }
        }
      })
      ts.load_extension("fzf")
    end
}
