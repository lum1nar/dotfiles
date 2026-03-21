local fzf = require("fzf-lua")

vim.keymap.set("n", "<C-f>", fzf.files, { desc = "Find [F]iles", noremap = true })
vim.keymap.set("n", "<C-h>", fzf.oldfiles, { desc = "Find [H]istory Files", noremap = true })
vim.keymap.set("n", "<C-p>", fzf.git_files, { desc = "Find [P]roject files" })
vim.keymap.set("n", "<C-g>", fzf.live_grep_native, { desc = "Live [G]rep file" })

vim.keymap.set("n", "<C-n>", function()
	require("fzf-lua").live_grep_native({
		cwd = vim.fn.expand("~/obsidian/4 - 筆記/"),
	})
end, { desc = "Find [N]ote" })
