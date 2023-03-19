return {
	"folke/trouble.nvim",
	opts = { use_diagnostic_signs = true },
	event = "BufAdd",
	keys = {
		{ "<leader>x", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Trouble" },
		{ "<leader>y", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Trouble" },
	},
}
