return {
	"nvim-tree/nvim-tree.lua",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	},
	config = function()
		require("nvim-tree").setup({
			hijack_unnamed_buffer_when_opening = true,
			sync_root_with_cwd = true,
			view = {
				side = "right",
				signcolumn = "no",
			},
			hijack_cursor = true,
			diagnostics = {
				enable = true,
			},
			git = {
				enable = true,
				ignore = true, --toggle via the toggle_git_ignored action, default mapping I.
				show_on_dirs = false,
			},
			modified = {
				enable = true,
			},
			-- Use this to set your nvim-tree specific mappings. See nvim-tree-mappings (function or "default")
			renderer = {
				icons = {
					padding = "   ",
					git_placement = "after",
					modified_placement = "after",
					show = {
						git = true,
						modified = true,
						folder_arrow = true,
					},
				},
				highlight_git = true,
				-- highlight_opened_files = "all", -- "none" "icon" "name" "all"
				highlight_modified = "all", -- same as above (available options)
				-- add_trailing = true,
				root_folder_label = ":~:.",
				indent_markers = {
					enable = true,
				},
				group_empty = false, --compact folder's that only contains a single folder into one node on the file tree
			},
			filters = {
				dotfiles = true, -- toggle via toggle_dotfiles action, default mapping H.
			},
		})
	end,
}
