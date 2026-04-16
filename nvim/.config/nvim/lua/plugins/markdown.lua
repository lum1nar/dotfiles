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
		ft = { "markdown", "codecompanion" },
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			code = {
				disable_background = {},
			},
		},
	},
}
