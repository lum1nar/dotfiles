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
		ft = { "markdown", "codecompanion", "codecompanion_input" },
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			win_options = {
				conceallevel = {
					default = vim.o.conceallevel,
					rendered = 3,
				},
			},
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
				-- disable_background = { "diff" },
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
