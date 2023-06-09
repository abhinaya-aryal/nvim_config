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
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "toggleterm", "term" },
			},
			system_open = {
				cmd = "xdg-open",
			},
			view = {
				side = "right",
				signcolumn = "yes",
			},
			hijack_cursor = true,
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
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
					padding = "  ",
					git_placement = "after",
					modified_placement = "before",
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
				custom = { "node_modules", "yarn.lock" },
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Set Root"))
				vim.keymap.set("n", "i", api.node.show_info_popup, opts("Info"))
				vim.keymap.set("n", "fr", api.fs.rename_sub, opts("Rename: Omit Filename"))
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
				vim.keymap.set("n", "p", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
				vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
				vim.keymap.set("n", "<C-r>", api.node.run.cmd, opts("Run Command"))
				vim.keymap.set("n", "<bs>", api.tree.change_root_to_parent, opts("Navigate Up"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "bm", api.marks.bulk.move, opts("Move Bookmarked"))
				vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Buffer"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
				vim.keymap.set("n", "gp", api.node.navigate.git.prev, opts("Prev Git"))
				vim.keymap.set("n", "gn", api.node.navigate.git.next, opts("Next Git"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
				vim.keymap.set("n", "e", api.tree.expand_all, opts("Expand All"))
				vim.keymap.set("n", "rb", api.fs.rename_basename, opts("Rename: Basename"))
				vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
				vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "ca", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
				vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
				vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
				vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
				vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
				vim.keymap.set("n", "sy", api.node.run.system, opts("Run System"))
				vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
				vim.keymap.set("n", "z", api.tree.collapse_all, opts("Collapse"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			end,
		})
	end,
}
