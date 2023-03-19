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
				separator_style = "padded_slant",
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						text = "File Explorer",
						padding = 1,
					},
				},
				--[[ highlights = {
					fill = {
						fg = { attribute = "fg", highlight = "#ff0000" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					background = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					buffer_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					close_button = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},
					close_button_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					tab_selected = {
						fg = { attribute = "fg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},

					tab = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					tab_close = {
						-- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
						fg = { attribute = "fg", highlight = "TabLineSel" },
						bg = { attribute = "bg", highlight = "Normal" },
					},

					duplicate_selected = {
						fg = { attribute = "fg", highlight = "TabLineSel" },
						bg = { attribute = "bg", highlight = "TabLineSel" },
						italic = true,
					},

					duplicate_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
						italic = true,
					},

					duplicate = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
						italic = true,
					},

					modified = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					modified_selected = {
						fg = { attribute = "fg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},

					modified_visible = {
						fg = { attribute = "fg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					separator = {
						fg = { attribute = "bg", highlight = "TabLine" },
						bg = { attribute = "bg", highlight = "TabLine" },
					},

					separator_selected = {
						fg = { attribute = "bg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},

					indicator_selected = {
						fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
				},
        --]]
			},
		})
	end,
}
