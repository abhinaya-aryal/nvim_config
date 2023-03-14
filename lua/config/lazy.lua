local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
	defaults = {
		lazy = true,
		version = false, --always use the latest git commit
	},
	install = { missing = true, colorscheme = { "tokyonight" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	  performance = {
		  rtp = {
			  disabled_plugins = {
				  "gzip",
				  "matchit",
				  "matchparen",
				  "netrwPlugin",
				  "tarPlugin",
				  "tohtml",
				  "tutor",
				  "zipPlugin",
			  }
		  }
	  }
})

vim.keymap.set("n", "<leader>z", "<cmd>Lazy<cr>", {desc = "Lazy" })
