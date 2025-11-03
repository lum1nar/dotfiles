local ls = require("luasnip")

-- Jump forward / backward bewtten placeholders

vim.keymap.set({ "i", "s", "n" }, "<C-j>", "<Nop>", { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
