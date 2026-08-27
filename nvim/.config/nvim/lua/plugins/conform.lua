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
			html = { "prettierd" },
			css = { "prettierd" },
			astro = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" }, -- e.g. package.json is a JSON with Comments file
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			prisma = { "prettierd" },
			sh = { "shfmt" },
			fish = { "prettierd" },
			lua = { "stylua" },
			sql = { "pg_format" },
		},

		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
