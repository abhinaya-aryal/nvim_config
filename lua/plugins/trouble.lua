return {
	"folke/trouble.nvim",
	opts = { use_diagnostic_signs = true },
	keys = {
		{"<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Document Diagnostics (Trouble)" },
	},
}
