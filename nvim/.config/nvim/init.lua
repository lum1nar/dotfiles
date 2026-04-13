-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({ { "Failed to clone lazy.nvim from " .. lazyrepo, "ErrorMsg" } }, true, {})
	end
end

if vim.uv.fs_stat(lazypath) then
	vim.opt.runtimepath:prepend(lazypath)
end

-- source lua files
local util = require("utils")
local require = util.require

require("config.options") -- vim options
require("config.lazy") -- Lazy plugin manager

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.mappings")
		require("config.autocmds")
		require("lsp.listeners")
		require("lsp.diagnostics")
		require("lsp.capabilities")
	end,
})
