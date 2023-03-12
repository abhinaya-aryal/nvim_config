return {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
  keys = {
    {
      "<a-n>", '<cmd>lua require("illuminate").goto_next_reference(wrap)<cr>', desc = "Move cursor to next highlight"
    },
    {
      "<a-p>", '<cmd>lua require("illuminate").goto_prev_reference(wrap)<cr>', desc = "Move cursor to previous highlight"
    },
  },
  config = function()
    vim.g.Illuminate_ftblacklist = {"alpha", "NeoTree"}
    require("illuminate").configure {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 150,
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NeoTree",
        "packer",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
      },
      filetypes_allowlist = {},
      modes_denylist = {},
      modes_allowlist = {},
      providers_regex_syntax_denylist = {},
      providers_regex_syntax_allowlist = {},
      under_cursor = true,
    }
  end,
}
