local short_indent = {
	["css"] = true,
	["javascript"] = true,
	["javascriptreact"] = true,
	["json"] = true,
	["lua"] = true,
	["markdown"] = true,
	["org"] = true,
	["tex"] = true,
	["text"] = true,
	["yaml"] = true,
}

local M = {
	set_indent = function(ft)
		local indent = short_indent[ft] and 2 or 4
		vim.api.nvim_set_option_value("tabstop", indent, {})
		vim.api.nvim_set_option_value("shiftwidth", 0, {})
	end,
}

return M
