return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	opts = {
		--[[ things you want to change go here]]
		direction = "horizontal",
	},
	keys = {

		{
			"<c-t>",
			"<cmd>ToggleTerm<cr>",
			mode = { "v", "t", "n" },
			desc = "Toggle Terminal",
		},
	},
}
