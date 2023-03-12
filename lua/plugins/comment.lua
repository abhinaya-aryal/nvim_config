return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup()
  end,
  keys = {
    {
      "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Change a line into commit", mode = { "n", "x" }
    },
  },
}

