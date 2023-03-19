return {
	"RRethy/vim-illuminate",
	event = "BufAdd",
	keys = {
		{
			"<A-n>",
			'<cmd>lua require("illuminate").next_reference{wrap=true}<cr>',
			desc = "Move to next highlight",
		},
		{
			"<A-p>",
			'<cmd>lua require("illuminate").next_reference{reverse=true,wrap=true}<cr>',
			desc = "Move to previous highlight",
		},
	},
	config = function()
		vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
		require("illuminate").configure({
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"alpha",
				"NvimTree",
				"lazy",
				"neogitstatus",
				"Trouble",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
				"DressingSelect",
				"TelescopePrompt",
			},
			under_cursor = true,
		})
	end,
}
