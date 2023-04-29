return {
	"folke/todo-comments.nvim",
	event = "BufAdd",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("todo-comments").setup({})
	end,
	keys = {
		{ "<leader>fi", "<cmd>TodoTelescope<cr>", desc = "Find TODO info" },
		{ "<leader>w", "<cmd>TodoTrouble<cr>", desc = "Todos & INFO" },
	},
}
