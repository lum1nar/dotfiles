return {
	"sudo-tee/opencode.nvim",
	-- dir = "/Users/lum1na/clone/opencode.nvim",
	branch = "main",
	lazy = false,
	config = function()
		require("opencode").setup({})
	end,
}
