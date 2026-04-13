return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		sources = {
			per_filetype = {
				codecompanion = { "codecompanion" },
			},
			providers = {
				snippets = {
					opts = {
						friendly_snippets = true, -- default

						-- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
						-- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
						-- the following is just an example, you should only enable the frameworks that you use
						extended_filetypes = {
							typescript = { "javascript" },
							typescriptreact = { "javascript" },
							javascriptreact = { "javascript" },
							markdown = { "jekyll" },
							sh = { "shelldoc" },
							php = { "phpdoc" },
							cpp = { "unreal" },
						},
					},
				},
			},
		},
		completion = {
			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
			menu = { border = "rounded" },
			-- Display a preview of the selected item on the current line
			-- ghost_text = { enabled = true },
		},
		keymap = {
			preset = "none",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
