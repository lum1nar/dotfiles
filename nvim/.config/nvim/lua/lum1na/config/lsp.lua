-- LSP CONFIG
local servers = {
	"bashls", -- bash-language-server
	"pyright", -- python
	"clangd", -- c
	"lua_ls", -- lua-language-server
	"marksman", -- markdown lsp
	"vtsls", -- typescript-language-server
	"eslint", -- eslint-lsp
	"html", -- html-lsp
	"cssls", -- css-lsp
	"emmet_ls", -- emmet-lsp
	"jsonls", -- json-lsp
	"tailwindcss", -- tailwindcss-lsp
	"prismals", -- prisma-language-server
	"docker_language_server", -- docker-lsp
	"fish_lsp", -- fish-lsp
}
local linter_formatters = {
	"black", -- python
	"prettier", -- Multiple filetypes
	"shfmt", -- Bash
	"stylua", -- lua
	"pgformatter", -- postgres formatter
	"sqlfluff", -- postgres linter
}

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }, -- change to your dialect
		}),
	},
})

require("mason").setup({
	registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = linter_formatters,
	auto_update = true,
	run_on_start = true,
	automatic_installation = true,
})

require("blink.cmp").setup({
	sources = {
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
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		-- Display a preview of the selected item on the current line
		-- ghost_text = { enabled = true },
	},
	keymap = {
		preset = "none",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},
})

-- Enable border for all the floating window
vim.o.winborder = "rounded"

-- Float Window Highlight Group
local float_border_fg = "#575279"
vim.api.nvim_set_hl(0, "FloatBorder", {
	fg = float_border_fg, -- 邊框顏色
})

vim.diagnostic.config({
	signs = {
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
		},
		text = {
			[vim.diagnostic.severity.ERROR] = "X",
			[vim.diagnostic.severity.HINT] = "?",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.WARN] = "!",
		},
	},
	float = {
		border = "rounded",
		source = "always",
	},
	update_in_insert = false,
	virtual_text = false,
	virtual_lines = { current_line = true },
})

-- Blink Highlight Group
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#fcf1e1", fg = "#575279" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#fcf1e1", fg = "#575279" })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "#fcf1e1", fg = "#575279" })

vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = vim.loop.cwd, -- 或你原本的 root_markers
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" }, -- 這裡加上 vim
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}

require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" }, -- e.g. package.json is a JSON with Comments file
		yaml = { "prettier" },
		markdown = { "prettier" },
		prisma = { "prettier" },
		sh = { "shfmt" },
		fish = { "prettier" },
		lua = { "stylua" },
		sql = { "pg_format" },
	},

	formatters = {
		prettier = {
			command = "prettier",
			args = { "--stdin-filepath", "$FILENAME" },
			cwd = require("conform.util").root_file({
				"package.json",
				".prettierrc",
			}),
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- ==================================================
-- LSP DEBUG SESSION
-- ==================================================

-- Keymap for LSP using fzf=-lua
local fzf = require("fzf-lua")

-- 定義 keymap
vim.keymap.set("n", "gd", function()
	fzf.lsp_definitions({ jump1 = true }) -- 單一結果直接跳
end, bufopts)

vim.keymap.set("n", "gD", function()
	fzf.lsp_declarations({ jump1 = true })
end, bufopts)

vim.keymap.set("n", "gi", function()
	fzf.lsp_implementations({ jump1 = true })
end, bufopts)

vim.keymap.set("n", "gr", function()
	fzf.lsp_references({ jump1 = true })
end, bufopts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

-- Code actions + organize imports
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "<leader>oi", function()
	vim.lsp.buf.code_action({
		context = { only = { "source.organizeImports" } },
		apply = true,
	})
end, bufopts)

-- Keymap for format code
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format code" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
vim.keymap.set("n", "<leader>d", "<cmd> lua vim.diagnostic.open_float() <CR>")
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)

vim.keymap.set("n", "gai", require("fzf-lua").lsp_incoming_calls, { desc = "LSP Incoming Calls" })
vim.keymap.set("n", "gao", require("fzf-lua").lsp_outgoing_calls, { desc = "LSP Outgoing Calls" })
