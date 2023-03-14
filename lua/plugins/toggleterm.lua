return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			size = 7,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = true,
			insert_mapping = true,
			terminal_mappings = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
