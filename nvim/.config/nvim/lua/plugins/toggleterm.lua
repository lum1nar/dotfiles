return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	opts = {
		--[[ things you want to change go here]]
		direction = "float",
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
