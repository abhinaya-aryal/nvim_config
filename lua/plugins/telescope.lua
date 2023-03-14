return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>f",
			"<cmd>Telescope<cr>",
			desc = "Telescope",
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find File",
		},
		{
			"<leader>ft",
			"<cmd>Telescope live_grep<cr>",
			desc = "Find Text",
		},
		{
			"<leader>fp",
			"<cmd>Telescope projects<cr>",
			desc = "Find Project",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "Find Buffer",
		},
		{
			"<leader>fg",
			"<cmd>Telescope git_files<cr>",
			desc = "Search in Git",
		},
		{
			"<leader>fc",
			"<cmd>Telescope commands<cr>",
			desc = "Find Commands",
		},
	},
}
