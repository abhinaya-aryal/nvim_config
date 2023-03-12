return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = "BufReadPost",
  keys = {
    {"<c-space>", desc = "Increment selection"},
    {"<bs>", desc = "Shrink selection", mode = "x"},
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "html",
        "markdown",
        "markdown_inline",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "zig",
        "c",
        "vim",
      },
      auto_install = true,
      sync_install = false,

      highlight = {
        enable = true,
        disable = {"css"},
      },
      autopairs = {
        enable = true,
      },
      indent = {enable = true, disable = {"python", "css"}},
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end
}
