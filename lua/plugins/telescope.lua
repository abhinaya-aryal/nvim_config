return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ahmedkhalf/project.nvim" },
	},
	config = function()
		require("telescope").setup({})
		require("project_nvim").setup({})
		require("telescope").load_extension("projects")
	end,
	cmd = "Telescope",
	keys = {
		{
			"<leader>t",
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
