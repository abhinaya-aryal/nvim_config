return {
	"neovim/nvim-lspconfig",
	event = { "BufAdd", "BufRead", "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "lukas-reineke/lsp-format.nvim" },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		local on_attach = require("config.handlers").on_attach
		local capabilities = require("config.handlers").capabilities
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		-- INFO: Setting up mason
		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssls",
				"html",
				"tsserver",
				"zls",
				"bashls",
				"lua_ls",
			},
			automatic_installation = true,
		})

		-- INFO: Automatic setting up installed lsps from mason
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							-- Do not send telemetry data containing a randomized but unique identifier
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			["jsonls"] = function()
				require("lspconfig").jsonls.setup({
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				})
			end,
		})

		-- INFO: Calling setup function from handler file of config directory
		require("config.handlers").setup()

		-- INFO: Configuring null_ls for code formatting
		local null_ls = require("null-ls")
		local b = null_ls.builtins
		local function eslint_config_exists()
			local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
			if not vim.tbl_isempty(eslintrc) then
				return true
			end
			local current_dir = vim.fn.getcwd()
			local config_file = current_dir .. "/package.json"
			if vim.fn.filereadable(config_file) == 1 then
				if vim.fn.json_decode(vim.fn.readfile(config_file))["eslintConfig"] then
					return true
				end
			end
			return false
		end

		local function rome_config_exists()
			local current_dir = vim.fn.getcwd()
			local config_file = current_dir .. "/rome.json"
			if vim.fn.filereadable(config_file) == 1 then
				return true
			end
			return false
		end
		local function deno_config_exists()
			local current_dir = vim.fn.getcwd()
			local config_file = current_dir .. "/deno.json"
			if vim.fn.filereadable(config_file) == 1 then
				return true
			end

			local jsonc_file = current_dir .. "/deno.jsonc"
			if vim.fn.filereadable(jsonc_file) == 1 then
				return true
			end

			return false
		end

		local sources = {
			b.diagnostics.codespell,
			-- b.diagnostics.misspell,
			b.code_actions.cspell,
			-- b.diagnostics.cspell,
			-- b.diagnostics.write_good,
			-- b.code_actions.proselint,
			-- b.formatting.rustywind,
			b.code_actions.eslint_d.with({
				filetype = {
					"javascript",
					"javascriptreact",
					"vue",
					"typescript",
					"typescriptreact",
					"svelte",
				},
				condition = function()
					return eslint_config_exists() and not rome_config_exists()
				end,
			}),
			b.diagnostics.eslint_d.with({
				filetypes = { "javascript", "javascriptreact", "vue", "typescript", "typescriptreact", "svelte" },
				condition = function()
					return eslint_config_exists() and not rome_config_exists()
				end,
			}),
			b.formatting.eslint_d.with({
				filetypes = { "javascript", "javascriptreact", "vue", "typescript", "typescriptreact", "svelte" },
				condition = function()
					return eslint_config_exists() and not rome_config_exists()
				end,
			}),
			--[[ b.formatting.deno_fmt.with({
				filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
				condition = function()
					return deno_config_exists()
				end,
			}), ]]
			--[[ b.formatting.rome.with({
				condition = function()
					return rome_config_exists() and not eslint_config_exists() and not deno_config_exists()
				end,
			}), ]]
			b.formatting.prettierd.with({
				filetypes = {
					"javascript",
					"javascriptreact",
					"json",
					"jsonc",
					"typescript",
					"typescriptreact",
					"svelte",
					"html",
					"css",
				},
				condition = function()
					return not rome_config_exists() and not deno_config_exists()
				end,
			}),
			b.formatting.stylua,
			-- b.formatting.rustfmt,
			-- b.formatting.gofmt,
			-- b.diagnostics.revive,
			-- b.diagnostics.protolint,
		}
		null_ls.setup({
			on_attach = function(client)
				--fomat on save
				require("lsp-format").on_attach(client)
			end,
			sources = sources,
		})
	end,
	keys = {
		{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		{ "<leader>i", "<cmd>LspInfo<cr>", desc = "LspInfo" },
	},
}
