return {
	{
		"lum1nar/float-toc.nvim",
		dev = false,
		cmd = "FloatTOC",
		opts = {
			bullet_icon = "⁍",
			indent_width = 4,
		},
	},
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown", "codecompanion" },
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
		config = function()
			local presets = require("markview.presets")

			require("markview").setup({
				markdown = {
					headings = presets.headings.slanted,
				},
			})
		end,
	},
}
