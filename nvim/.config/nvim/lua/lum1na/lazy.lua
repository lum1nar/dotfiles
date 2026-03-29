return require("lazy").setup({

	--------------------------------------------------------------------------- Colorscheme ------------------------------------------------------------------------
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("lum1na.config.rose-pine")
			vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("lum1na.config.tokyonight")
	-- 		-- vim.cmd("colorscheme tokyonight-moon")
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/everforest",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Optionally configure and load the colorscheme
	-- 		-- directly inside the plugin declaration.
	-- 		require("lum1na.config.everforest")
	-- 		vim.cmd.colorscheme("everforest")
	-- 	end,
	-- },
	{
		"serhez/teide.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd([[colorscheme teide-dimmed]])
			require("lum1na.config.teide")
			-- vim.schedule(function()
			-- 	vim.cmd("colorscheme teide-dimmed")
			-- end)
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("lum1na.config.alpha")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		run = ":TSUpdate",
		config = function()
			require("lum1na.config.treesitter")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("lum1na.config.nvim-ts-autotag")
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			require("lum1na.config.undotree")
		end,
		event = VeryLazy,
	},
	{
		"rcarriga/nvim-notify",
		priority = 1000,
		config = function()
			require("lum1na.config.nvim-notify")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("lum1na.config.neoscroll")
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("lum1na.config.code_runner")
		end,
		event = VeryLazy,
	},
	{
		"olimorris/codecompanion.nvim",
		cmd = {
			"CodeCompanion",
			"CodeCompanionChat",
			"CodeCompanionToggle",
			"CodeCompanionAsk",
		},
		config = function()
			require("lum1na.config.codecompanion")
			require("lum1na.config.fidget-companioncode")
		end,
	},
	{ "ravitemer/codecompanion-history.nvim", event = "VeryLazy" },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{
				"<leader>pt",
				"<cmd>NvimTreeToggle<CR>",
				desc = "Toggle Nvim Tree",
			},
		},
		config = function()
			require("lum1na.config.nvim-tree")
		end,
	},
	{
		"stevearc/oil.nvim",
		lazy = true,
		keys = {
			{
				"<C-e>",
				"<cmd>Oil<CR>",
				desc = "Toggle Nvim Tree",
			},
		},
		config = function()
			require("lum1na.config.oil")
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
		config = function()
			require("lum1na.config.autoclose")
		end,
	},
	{
		"voldikss/vim-floaterm",
		config = function()
			require("lum1na.config.vim-floaterm")
		end,
		event = VeryLazy,
	},
	{
		"brianhuster/live-preview.nvim",
		lazy = true,
		keys = {
			{
				"<leader>h",
				function()
					vim.cmd([[LivePreview start]])
				end,
				desc = "Live Preview",
			},
		},
	},
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			-- One handed keymap recommended, you will be using the mouse
			{
				"<leader>v",
				function()
					require("oklch-color-picker").pick_under_cursor()
				end,
				desc = "Color pick under cursor",
			},
		},
		opts = {},
	},
	{
		"lum1nar/float-toc.nvim",
		dev = false,
		opts = {
			-- your options here
		},
		config = function()
			require("lum1na.config.float-toc")
		end,
	},
	{
		"lum1nar/peep.nvim",
		dev = false,
		config = function()
			require("peep").setup({
				colors = {
					label_main = { fg = "#A72703", bg = "#FCB53B" },
					label_sub = { fg = "#FCB53B", bg = "#44415a" },
					line_aux = { fg = "#9893a5" },
					line_preview = { fg = "#7aa2f7" },
				},

				peep = {
					duration = 700,
					column = false,
					auxline_icon = "·",
					key_trigger = true,
					trigger_keys = { "y", "d", "c", "v", "V" },
					line_preview = true,
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
				require("peep").peep()
			end, { desc = "Peep" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
		config = function()
			require("lum1na.config.nvim-treesitter-textobjects")
		end,
		event = "VeryLazy",
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = true,
		ft = { "markdown" },
		config = function()
			require("lum1na.config.markview")
		end,

		-- Completion for `blink.cmp`
		-- dependencies = { "saghen/blink.cmp" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lum1na.config.lualine")
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	-- LSP CONFIG
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lum1na.config.lsp")
		end,
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"rafamadriz/friendly-snippets",
			"stevearc/conform.nvim",
			{ "saghen/blink.cmp", build = "cargo build --release" },
		},
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {},
		---@diagnostic enable: missing-fields

		config = function()
			require("lum1na.config.fzf-lua")
		end,
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}, {
	dev = {
		path = "~/nvim-plugin",
	},
})
