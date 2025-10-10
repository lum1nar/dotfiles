vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', {expr=true, silent=true})


-- Disable copilot globally
vim.g.copilot_enabled = false

