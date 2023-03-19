return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" }, -- buffer completion
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-path" }, --path completions
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "tzachar/cmp-tabnine", build = "./install.sh" },
	},
	config = function()
		local snippet = require("luasnip")
		snippet.filetype_extend("javascriptreact", { "html" })

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

		local tabnine = require("cmp_tabnine.config")
		tabnine:setup({
			max_lines = 1000,
			max_num_results = 20,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = "..",
			ignored_file_types = {
				-- lua = true,
			},
		})

		local kind_icons = {
			Text = "",
			Method = "",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰫧",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}

		vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
		local cmp = require("cmp")
		cmp.setup({
			preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args)
					snippet.lsp_expand(args.body) -- for 'luasnip' users
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<c-j>"] = cmp.mapping.select_next_item(),
				["<c-k>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif snippet.expandable() then
						snippet.expand()
					elseif snippet.expand_or_jumpable() then
						snippet.expand_or_jump()
					elseif check_backspace() then
						cmp.complete()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif snippet.jumpable(-1) then
						snippet.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "cmp_tabnine" },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = kind_icons[vim_item.kind]

					-- if entry.source.name == "cmp_tabnine" then
					-- vim_item.kind = string.format("%s %s", " ", " TabNine")
					-- vim_item.kind_hl_group = "CmpItemKindTabnine"
					-- end
					vim_item.menu = ({
						nvim_lsp = "[Lsp]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Nvim_Lua]",
						cmp_tabnine = "[Tabnine]",
						buffer = "[Buffer]",
						path = "[Path]",
						emoji = "[Emoji]",
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
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			}),
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
