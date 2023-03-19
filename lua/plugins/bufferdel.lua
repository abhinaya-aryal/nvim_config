return {
	"moll/vim-bbye",
	event = "BufAdd",
	keys = {
		{ "<leader>q", "<cmd>update<cr><cmd>Bwipeout<cr>", desc = "Close Buffer" },
	},
}
