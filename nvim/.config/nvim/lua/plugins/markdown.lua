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
			heading = {
				width = "block",
				left_pad = 2,
				right_pad = 4,
			},
			code = {
				disable_background = {},
				width = "block",
				min_width = 45,
				left_pad = 2,
				language_pad = 2,
			},
		},
	},
}
