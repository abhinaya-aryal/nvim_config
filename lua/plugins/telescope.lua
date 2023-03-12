return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {"nvim-lua/plenary.nvim", lazy = true},
    {
      "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
    }
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"
    },
    {
      "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text"
    },
    {
      "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find Projects"
    },
    {
      "<leader>fb", "<cmd>Telescope buffer<cr>", desc = "Find Buffer"
    },
  },
}
