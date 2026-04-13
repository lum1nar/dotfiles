return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			python = { "black" },
			javascript = { "biome", "biome-organize-imports" },
			typescript = { "biome", "biome-organize-imports" },
			javascriptreact = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
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

		-- formatters = {
		-- 	prettier = {
		-- 		command = "prettier",
		-- 		args = { "--stdin-filepath", "$FILENAME" },
		-- 		cwd = require("conform.util").root_file({
		-- 			"package.json",
		-- 			".prettierrc",
		-- 		}),
		-- 	},
		-- },

		format_after_save = {
			lsp_fallback = true,
		},
	},
}
