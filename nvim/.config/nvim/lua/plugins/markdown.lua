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
				icons = {
					"  󰲡 ",
					"    󰲣 ",
					"      󰲥 ",
					"        󰲧 ",
					"          󰲩 ",
					"            󰲫 ",
				},
				width = "block",
				min_width = 30,
			},
			code = {
				disable_background = {},
				-- position = "right",
				width = "block",
				right_pad = 10,
				language_border = " ",
				language_left = "",
				language_right = "",
			},
		},
	},
}
