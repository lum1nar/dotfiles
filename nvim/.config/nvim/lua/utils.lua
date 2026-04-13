local M = {}

M.signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
	GitAdded = "",
	GitModified = "",
	GitRemoved = "",
	GitRenamed = "",
	Running = "",
	PassCheck = "",
	CheckAlt = " ",
	Forbidden = "",
	FolderClosed = "",
	FolderOpen = "",
	FolderEmpty = "",
	FolderEmptyOpen = "",
	LightBulb = "",
	Config = "",
	Branch = "",
	Code = " ",
	Package = " ",
	Keyboard = " ",
	File = " ",
	Vim = " ",
	QuestionMark = " ",
	Loading = " ",
	Cmd = " ",
	Event = " ",
	Init = " ",
	Expanded = "",
	Collapsed = "",
	Bookmark = "",
	PendingSave = "",
	Left = "",
	Right = "",
}

function M.try(fn, ...)
	local args = { ... }

	return xpcall(function()
		---@diagnostic disable-next-line: deprecated
		return fn(unpack(args))
	end, function(err)
		local lines = {}
		table.insert(lines, err)
		table.insert(lines, debug.traceback("", 3))

		M.error(table.concat(lines, "\n"))
		return err
	end)
end

function M.require(mod)
	local ok, ret = M.try(require, mod)
	return ok and ret
end

function M.error(msg, name)
	vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.lsp_document_symbols()
	require("fzf-lua").lsp_document_symbols({
		regex_filter = "Class|Function|Method|Constructor|Interface|Module|Struct|Trait|Field|Property",
	})
end

return M
