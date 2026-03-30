local fzf = require("fzf-lua")
fzf.setup({
	fzf_colors = {
		true, -- inherit fzf colors that aren't specified below from
		-- the auto-generated theme similar to `fzf_colors=true`
		["fg"] = { "fg", "CursorLine" },
		["bg"] = { "bg", "Normal" },
		["hl"] = { "fg", "Comment" },
		["fg+"] = { "fg", "Normal", "underline" },
		["bg+"] = { "bg", { "CursorLine", "Normal" } },
		["hl+"] = { "fg", "Statement" },
		["info"] = { "fg", "PreProc" },
		["prompt"] = { "fg", "Conditional" },
		["pointer"] = { "fg", "Exception" },
		["marker"] = { "fg", "Keyword" },
		["spinner"] = { "fg", "Label" },
		["header"] = { "fg", "Comment" },
		["gutter"] = "-1",
	},
})

vim.keymap.set("n", "<C-f>", fzf.files, { desc = "Find [F]iles", noremap = true })
vim.keymap.set("n", "<C-h>", function()
	fzf.combine({ pickers = "buffers;oldfiles" })
end, { desc = "Find [H]istory Files and Buffers", noremap = true })
vim.keymap.set("n", "<C-p>", fzf.git_files, { desc = "Find [P]roject files" })
vim.keymap.set("n", "<C-g>", fzf.live_grep_native, { desc = "Live [G]rep file" })

vim.keymap.set("n", "<C-n>", function()
	require("fzf-lua").live_grep_native({
		cwd = vim.fn.expand("~/obsidian/4 - 筆記/"),
	})
end, { desc = "Find [N]ote" })
