return {
	"windwp/nvim-ts-autotag",
	event = "BufAdd",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
