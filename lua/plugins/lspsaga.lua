return {
	"glepnir/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
			},
		})
	end,
	cmd = "Lspsaga",
	keys = {
		{
			"<leader>h",
			"<cmd>Lspsaga lsp_finder<cr>",
			desc = "Definition",
		},
		{
			"<leader>a",
			"<cmd>Lspsaga code_action<cr>",
			desc = "Code Actions",
			mode = { "n", "v" },
		},
		{
			"<leader>r",
			"<cmd>Lspsaga rename<cr>",
			desc = "Lsp Rename",
		},
		{
			"<leader>d",
			"<cmd>Lspsaga peek_definition<cr>",
			desc = "Peek Definition",
		},
		{
			"<leader>g",
			"<cmd>Lspsaga goto_definition<cr>",
			desc = "GoTo Definition",
		},
		{
			"<leader>l",
			"<cmd>Lspsaga show_line_diagnostics<cr>",
			desc = "Line Diagnostics",
		},
		{
			"<leader>c",
			"<cmd>Lspsaga show_cursor_diagnostics<cr>",
			desc = "Cursor Diagnostics",
		},
		{
			"<leader>b",
			"<cmd>Lspsaga show_buf_diagnostics<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>p",
			"<cmd>Lspsaga diagnostic_jump_prev<cr>",
			desc = "Jump to Previous Diagnostics",
		},
		{
			"<leader>n",
			"<cmd>Lspsaga diagnostic_jump_next<cr>",
			desc = "Jump to Next Diagnostics",
		},
		{
			"<leader>o",
			"<cmd>Lspsaga outline<cr>",
			desc = "Toggle Outline",
		},
		{
			"<leader>k",
			"<cmd>Lspsaga hover_doc<cr>",
			desc = "Hover Doc",
		},
		{
			"<leader>s",
			"<cmd>Lspsaga peek_type_definition<cr>",
			desc = "Peek Type Definition",
		},
		{ "<leader>v", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to Type Definition" },

		{ "<leader>j", "<cmd>Lspsaga term_toggle<cr>", desc = "Floating Terminal" },
	},
}
