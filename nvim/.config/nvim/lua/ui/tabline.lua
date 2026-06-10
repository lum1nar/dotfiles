local M = {}

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.require('ui.tabline').render()"

local num_icons = {
	"󰎤 ",
	"󰎧 ",
	"󰎪 ",
	"󰎭 ",
	"󰎱 ",
	"󰎳 ",
	"󰎶 ",
	"󰎹 ",
	"󰎼 ",
	"󰽽 ",
}

function M.render()
	local bufs = vim.tbl_filter(function(buf)
		return vim.fn.buflisted(buf) == 1
	end, vim.api.nvim_list_bufs())

	local current_buf = vim.api.nvim_get_current_buf()
	local out = {}

	for i, buf in ipairs(bufs) do
		local hl = (buf == current_buf) and "%#TabLineSel#" or "%#TabLine#"
		local icon = num_icons[i] or tostring(i)
		local name = vim.api.nvim_buf_get_name(buf)

		if name == "" then
			name = "[No Name]"
		else
			name = vim.fn.fnamemodify(name, ":t")
		end

		table.insert(out, string.format("%s %s %s ", hl, icon, name))
	end

	return tools.hl_str("TabLineFill", "    ") .. table.concat(out) .. "%#TabLineFill#"
end

return M
