return {
	"folke/which-key.nvim",
	event = "BufAdd",
	config = function()
		require("which-key").setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			window = {
				border = "single",
				position = "bottom",
				margin = { 0, 0, 0, 0 },
				padding = { 0, 0, 0, 0 },
			},
		})
	end,
}
