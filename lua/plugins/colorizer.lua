return {
	"NvChad/nvim-colorizer.lua",
	lazy = false,
	config = function()
		require("colorizer").setup({
			user_default_options = {
				css = true,
				css_fn = true,
				tailwind = true,
				sass = { enable = true, parsers = { "css" } },
			},
			buftypes = {},
		})
	end,
}
