-- QoL Plugins
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"kylechui/nvim-surround",
		keys = { "ys", "ds", "cs" },
		config = true,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {
			lang = {
				astro = "<!-- %s -->",
				axaml = "<!-- %s -->",
				blueprint = "// %s",
				c = "// %s",
				c_sharp = "// %s",
				clojure = { ";; %s", "; %s" },
				cpp = "// %s",
				cs_project = "<!-- %s -->",
				cue = "// %s",
				fsharp = "// %s",
				fsharp_project = "<!-- %s -->",
				gleam = "// %s",
				glimmer = "{{! %s }}",
				graphql = "# %s",
				handlebars = "{{! %s }}",
				hcl = "# %s",
				html = "<!-- %s -->",
				hyprlang = "# %s",
				ini = "; %s",
				ipynb = "# %s",
				javascript = {
					"// %s", -- default commentstring when no treesitter node matches
					"/* %s */",
					call_expression = "// %s", -- specific commentstring for call_expression
					jsx_attribute = "// %s",
					jsx_element = "// %s ",
					jsx_fragment = "// %s ",
					spread_element = "// %s",
					statement_block = "// %s",
				},
				kdl = "// %s",
				php = "// %s",
				rego = "# %s",
				rescript = "// %s",
				rust = { "// %s", "/* %s */" },
				sql = "-- %s",
				styled = "/* %s */",
				svelte = "<!-- %s -->",
				templ = {
					"// %s",
					component_block = "<!-- %s -->",
				},
				terraform = "# %s",
				tsx = {
					"// %s", -- default commentstring when no treesitter node matches
					"/* %s */",
					call_expression = "// %s", -- specific commentstring for call_expression
					jsx_attribute = "// %s",
					jsx_element = "// %s ",
					jsx_fragment = "// %s ",
					spread_element = "// %s",
					statement_block = "// %s",
				},
				twig = "{# %s #}",
				typescript = { "// %s", "/* %s */" }, -- langs can have multiple commentstrings
				vue = "<!-- %s -->",
				xaml = "<!-- %s -->",
			},
		},
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	main = "ibl",
	-- 	opts = {
	-- 		scope = { enabled = false },
	-- 	},
	-- },
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
	-- {
	-- 	"mcauley-penney/visual-whitespace.nvim",
	-- 	-- lazy = false,
	-- 	event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
	-- 	opts = {
	-- 		-- your opts here ...
	-- 		--   enabled = true,
	-- 		highlight = { link = "Visual", default = true },
	-- 		match_types = {
	-- 			space = true,
	-- 			tab = true,
	-- 			nbsp = true,
	-- 			lead = false,
	-- 			trail = false,
	-- 		},
	-- 		list_chars = {
	-- 			space = "·",
	-- 			tab = "↦",
	-- 			nbsp = "␣",
	-- 			lead = "‹",
	-- 			trail = "›",
	-- 		},
	-- 		fileformat_chars = {
	-- 			unix = "↲",
	-- 			mac = "←",
	-- 			dos = "↙",
	-- 		},
	-- 		ignore = { filetypes = {}, buftypes = {} },
	-- 	},
	-- },
}
