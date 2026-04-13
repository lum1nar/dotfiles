return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "buffers",
			indicator = {
				icon = " ", -- this should be omitted if indicator style is not 'icon'
				style = "icon",
			},
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "",
					separator = true,
				},
			},
			show_close_icon = false,
			show_buffer_close_icons = false,
			separator_style = "thin",
		},
	},
}
