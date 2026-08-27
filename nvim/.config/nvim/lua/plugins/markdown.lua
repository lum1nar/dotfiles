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
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
		opts = {
			anti_conceal = { enabled = false },
			file_types = { "markdown", "opencode_output" },
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
