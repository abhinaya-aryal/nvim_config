return {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
			},
		})
	end,
	keys = {
		{
			"<leader>gf",
			"<cmd>Lspsaga lsp_finder<cr>",
			desc = "Lsp Finder",
		},
		{
			"<leader>ga",
			"<cmd>Lspsaga code_action<cr>",
			desc = "Code Actions",
			mode = { "n", "v" },
		},
		{
			"<leader>gr",
			"<cmd>Lspsaga rename<cr>",
			desc = "Lsp Rename",
		},
		{
			"<leader>gj",
			"<cmd>Lspsaga peek_definition<cr>",
			desc = "Peek Definition",
		},
		{
			"<leader>gg",
			"<cmd>Lspsaga goto_definition<cr>",
			desc = "GoTo Definition",
		},
		{
			"<leader>gd",
			"<cmd>Lspsaga show_line_diagnostics<cr>",
			desc = "Line Diagnostics",
		},
		{
			"<leader>gc",
			"<cmd>Lspsaga show_cursor_diagnostics<cr>",
			desc = "Cursor Diagnostics",
		},
		{
			"<leader>gb",
			"<cmd>Lspsaga show_buf_diagnostics<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>gn",
			"<cmd>Lspsaga diagnostic_jump_prev<cr>",
			desc = "Jump to Previous",
		},
		{
			"<leader>gp",
			"<cmd>Lspsaga diagnostic_jump_next<cr>",
			desc = "Jump to Next",
		},
		{
			"<leadear>gl",
			"<cmd>Lspsaga outline<cr>",
			desc = "Toggle Outline",
		},
		{
			"<leader>gi",
			"<cmd>Lspsaga incoming_calls<cr>",
			desc = "Incoming Calls",
		},
		{
			"<leader>go",
			"<cmd>Lspsaga outgoing_calls<cr>",
			desc = "Outgoing Calls",
		},
		{
			"<leader>gk",
			"<cmd>Lspsaga hover_doc<cr>",
			desc = "Hover Doc",
		},
	},
}
