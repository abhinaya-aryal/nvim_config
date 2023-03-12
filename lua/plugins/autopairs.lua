return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, --treesitter integration
      ts_conig = {
        lua = { "string", "source" },
        javascript = {"string", "template_string" },
        java = false,
      },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      }
    })
  end,
}
