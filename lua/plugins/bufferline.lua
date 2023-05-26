return {
	"akinsho/bufferline.nvim",
	event = "VimEnter",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				close_command = "Bwipeout! %d",
				right_moue_command = "Bwipeout! %d",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				-- separator_style = "padded_slant",
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						text = "File Explorer",
						padding = 1,
					},
				},
			},
		})
	end,
}
