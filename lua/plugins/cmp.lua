return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = false,
  dependencies = {
    { "hrsh7th/cmp-buffer" }, -- buffer completions
    { "hrsh7th/cmp-path" }, --path completions
    { "hrsh7th/cmp-nvim-lsp"},
    { "saadparwaiz1/cmp_luasnip" },
    { "tzachar/cmp-tabnine", build = "./install.sh" },
  },
  config = function()
    local snippet = require("luasnip")
    require("luasnip/loaders/from_vscode").lazy_load()
    local tabnine = require("cmp_tabnine.config")
    tabnine:setup {
      max_lines = 1000,
      max_num_results = 20,
      sort = true, 
      run_on_every_keystroke = true, 
      snippet_placeholder = "..",
      ignored_file_types = {
        -- lua
      },
    }
    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    vim.api.nvim_set_hl(0, "CmpItemKindTabnine", {fg = "#CA42F0"})
    local cmp = require("cmp")

    require("cmp").setup({
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- for 'luasnip' users
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<s-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "nvim_lua", keyword_length = 2 },
        { name = "cmp_tabnine" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 2},
        { name = "path" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind]

          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = string.format("%s %s", " ", " TabNine")
            vim_item.kind_hl_group = "CmpItemKindTabnine"
          end
          vim_item.menu = ({
            nvim_lsp = "",
            nvim_lua = "",
            luasnip = "",
            buffer = "",
            path = "",
            emoji = "",
          })[entry.source.name]
          return vim_item
        end,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      experimental = {
        ghost_text = true,
      },
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
