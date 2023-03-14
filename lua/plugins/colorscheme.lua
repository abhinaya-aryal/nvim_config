return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
  end,
}
