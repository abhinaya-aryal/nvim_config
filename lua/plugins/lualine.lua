return { 
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = {"error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = true,
			always_visible = true,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local location = {
			"location",
			padding = 0,
		}

		local spaces = function() 
			return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end
		
		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				disabled_filetypes = { "alpha", "dashboard" },
				always_divisible_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diagnostics },
				lualine_x = { diff, spaces, "encoding", filetype },
				lualine_y = { location },
				lualine_z = { "progress" },
			},
			})
	end
}
	
