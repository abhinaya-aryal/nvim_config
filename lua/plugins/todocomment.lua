return {
	"folke/todo-comments.nvim",
	event = "BufAdd",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("todo-comments").setup({})
	end,
}
