return {
	"sudo-tee/opencode.nvim",
	lazy = false,
	config = function()
		require("opencode").setup({})
	end,
	dependencies = {
		"MeanderingProgrammer/render-markdown.nvim",
		"saghen/blink.cmp",
		"ibhagwan/fzf-lua",
	},
}
