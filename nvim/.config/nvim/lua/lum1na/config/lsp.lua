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
}

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
		documentation = { auto_show = true },
	},
	keymap = {
		preset = "none",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},
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
	update_in_insert = false,
	virtual_text = false,
	virtual_lines = { current_line = true },
})

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
		yaml = { "prettier" },
		markdown = { "prettier" },
		prisma = { "prettier" },
		sh = { "shfmt" },
		fish = { "prettier" },
		lua = { "stylua" },
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

-- Keymap for format code
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format code" })

-- ==================================================
-- LSP DEBUG SESSION
-- ==================================================

-- Keymap for debug
vim.keymap.set(
	"n",
	"<leader>dp",
	"<cmd>lua vim.diagnostic.goto_prev()<CR>",
	{ desc = "Go to previous diagnostic message" }
)
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic message" })
vim.keymap.set(
	"n",
	"<leader>dd",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	{ desc = "Go to the definition of function or varialbe under curosr" }
)
vim.keymap.set(
	"n",
	"<leader>dr",
	"<cmd>lua vim.lsp.buf.references()<CR>",
	{ desc = "Find references for the code under cursor" }
)
