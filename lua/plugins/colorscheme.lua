return {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    local _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
  end,
}
