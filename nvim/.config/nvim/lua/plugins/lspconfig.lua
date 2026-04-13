local manual_installed = {
	"sqlfluff",
	"pgformatter",
	"stylua",
	"shfmt",
	"prettier",
	"black",
}

-- Manually install linter, formatter with the command above
vim.api.nvim_create_user_command("MasonInstallAll", function()
	local registry_ok, registry = pcall(require, "mason-registry")
	if not registry_ok then
		vim.notify("mason-registry not available", vim.log.levels.ERROR)
		return
	end
	for _, pkg_name in ipairs(manual_installed) do
		local ok, pkg = pcall(registry.get_package, pkg_name)

		if ok then
			if not pkg:is_installed() then
				vim.notify("Installing: " .. pkg_name)
				pkg:install()
			else
				vim.notify("Already installed: " .. pkg_name)
			end
		else
			vim.notify("Package not found: " .. pkg_name, vim.log.levels.WARN)
		end
	end
end, {})

-- Use mason-lspconfig to auto anable LSP
-- Use mason-lspconfig to auto install LSP
return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"bashls", -- bash-language-server
				"pyright", -- python
				"clangd", -- c
				"lua_ls", -- lua-language-server
				"marksman", -- markdown lsp
				-- "vtsls", -- typescript-language-server
				"html", -- html-lsp
				"cssls", -- css-lsp
				"emmet_ls", -- emmet-lsp
				"jsonls", -- json-lsp
				"tailwindcss", -- tailwindcss-lsp
				"prismals", -- prisma-language-server
				"docker_language_server", -- docker-lsp
				"fish_lsp", -- fish-lsp
				"jdtls", -- java-lsp
				"biome", -- ts linter
				-- "copilot",
			},
			automatic_enable = true,
		},
	},
	{ "artemave/workspace-diagnostics.nvim" },
}
