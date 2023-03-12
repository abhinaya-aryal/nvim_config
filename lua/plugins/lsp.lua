return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  dependencies = {
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"jose-elias-alvarez/null-ls.nvim"},
    {"lukas-reineke/lsp-format.nvim"},
    {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").setup({})
      end,
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
  keys = {
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
      desc = "i don't know"
    },
  },
}
