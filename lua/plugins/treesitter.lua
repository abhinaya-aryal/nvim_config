return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufAdd", "BufNewFile" },
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
				disable = {},
			},
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"js",
					"markdown",
				},
			},
			indent = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
