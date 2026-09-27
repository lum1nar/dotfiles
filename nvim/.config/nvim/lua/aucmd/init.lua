local augrp = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd
local get_opt = vim.api.nvim_get_option_value
local aucmd_fn = require("aucmd.functions")
local grp

---- Upon entering
grp = augrp("Entering", { clear = true })

aucmd("BufEnter", {
	group = grp,
	callback = function()
		local path = vim.api.nvim_buf_get_name(0)
		local root = tools.get_path_root(path)

		if root ~= nil then
			vim.cmd.lcd(vim.fn.fnameescape(root))

			tools.get_git_branch(root)
			tools.get_git_remote_name(root)
		end
	end,
	desc = "Set root dir and initialize version control branch",
})

aucmd("FileType", {
	group = grp,
	callback = function()
		local ft = get_opt("filetype", {})
		aucmd_fn.set_indent(ft)
	end,
	desc = "Set formatting options after ftplugins",
})

aucmd("BufNewFile", {
	group = grp,
	command = "silent! 0r " .. vim.fn.stdpath("config") .. "/templates/skeleton.%:e",
	desc = "If one exists, use a template when opening a new file",
})

aucmd("BufWinEnter", {
	group = grp,
	command = "silent! loadview",
	desc = "Restore view settings",
})

-- -- See https://vi.stackexchange.com/a/12710
-- aucmd({ "WinEnter", "BufWinEnter" }, {
-- 	group = grp,
-- 	callback = function()
-- 		if vim.w.email_match_id then
-- 			return
-- 		end
-- 		vim.w.email_match_id = vim.fn.matchadd("String", "\v[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}")
-- 	end,
-- 	desc = "Highlight email addresses",
-- })

---- LSP
---local lsp_utils = require("aucmd.lsp-utils")

local lsp_utils = require("aucmd.lsp-utils")

aucmd("LspAttach", {
	desc = "Configure LSP keymaps",
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if not client then
			return
		end

		lsp_utils.on_attach(client, bufnr)

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})

local opencode_cmd = "opencode"
---@type snacks.terminal.Opts
local snacks_terminal_opts = {
	win = {
		position = "right",
		enter = true,
		width = 0.4,
	},
}

---@type opencode.Opts
vim.g.opencode_opts = {
	server = {
		start = function()
			require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
		end,
	},
}

-- Can also leverage toggle functionality.
-- If you use <leader> here, remove 't' — otherwise Neovim will add input delay to your <leader> when typing in the terminal to watch for the mapping.
vim.keymap.set({ "n", "t" }, "<C-.>", function()
	require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
end, { desc = "Toggle OpenCode" })

-- Optionally show the terminal when OpenCode starts executing
vim.api.nvim_create_autocmd("User", {
	pattern = { "OpencodeEvent:session.execution.started" },
	callback = function()
		local win = require("snacks.terminal").get(opencode_cmd, { create = false })
		if win then
			win:show()
		end
	end,
})
