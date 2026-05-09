-- QoL Plugins
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			per_filetype = {
				html = { enable_close = false },
			},
		},
	},
	{
		"kylechui/nvim-surround",
		keys = { "ys", "ds", "cs" },
		config = true,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- {
	-- 	"lum1nar/peep.nvim",
	-- 	dev = false,
	-- 	lazy = false,
	-- 	opts = {
	-- 		colors = {
	-- 			label_main = { fg = "#A72703", bg = "#FCB53B" },
	-- 			label_sub = { fg = "#FCB53B", bg = "#44415a" },
	-- 			line_aux = { fg = "#9893a5" },
	-- 			line_preview = { fg = "#7aa2f7" },
	-- 		},
	--
	-- 		peep = {
	-- 			duration = 700,
	-- 			column = false,
	-- 			auxline_icon = "·",
	-- 			key_trigger = true,
	-- 			trigger_keys = { "y", "d", "c", "v", "V" },
	-- 			line_preview = true,
	-- 		},
	-- 	},
	-- },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
