return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufAdd",
	config = function()
		require("indent_blankline").setup({
			char = "┃",
			show_end_of_line = false,
			show_trailing_blankline_indent = false,
			use_treesitter = true,
			use_treesitter_scope = true,
			show_current_context = true,
			filetype_exclude = {
				-- "help",
				"packer",
				"NvimTree",
				"checkhealth",
				"man",
				"",
			},
		})
	end,
}
