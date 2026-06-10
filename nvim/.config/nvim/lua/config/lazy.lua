-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local signs = tools.ui.signs
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- load lazy
require("lazy").setup("plugins", {
	-- install = { colorscheme = { "rose-pine" } },
	defaults = { lazy = true },
	checker = { enabled = false },
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"rrhelper",
				"spellfile_plugin",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
	debug = false,
	ui = {
		size = { width = 0.8, height = 0.8 },
		icons = {
			loaded = signs.PassCheck,
			not_loaded = signs.QuestionMark,
			cmd = signs.Cmd,
			config = signs.Config,
			event = signs.Event,
			ft = signs.File,
			init = signs.Config,
			keys = signs.Keyboard,
			plugin = signs.Package,
			runtime = signs.Vim,
			source = signs.Code,
			start = signs.Init,
			task = signs.CheckAlt,
			lazy = signs.Loading,
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	},
	dev = {
		path = "~/nvim-plugin",
	},
})
