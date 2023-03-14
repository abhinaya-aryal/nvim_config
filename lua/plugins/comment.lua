return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    {"JoosepAlviste/nvim-ts-context-commentstring",lazy = true},
  },
  config = function()
    require("Comment").setup({
      pre_hook = function(ctx)
        if vim.bo.filetype == "typescriptreact" then
          local U = require "Comment.utils"
          local type = ctx.ctype.linewise and "__default" or "__multiline"
          local location = nil
          if ctx.ctype == U.ctype.blockwise then
            location = require("ts_context_commentstring.utils").get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
          end
          return require("ts_context_commentstring.internal").calculate_commentstring {
            key = type,
            location = location,
          }
        end
      end
    })
  end,
  keys = {
    {
      "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Comment Line", mode = { "n", "x" }
    },
  },
}

