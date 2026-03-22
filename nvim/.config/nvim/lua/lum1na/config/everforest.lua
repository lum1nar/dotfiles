vim.o.background = dark
vim.g.everforest_background = "dark" -- soft / medium / hard
vim.g.everforest_enable_italic = true
vim.g.everforest_enable_bold = true
vim.g.everforest_transparent_background = 2
vim.g.everforest_diagnostic_text_highlight = false
vim.g.everforest_diagnostic_line_highlight = false
vim.g.everforest_diagnostic_virtual_text = "colored"

vim.g.everforest_better_performance = 1

-- Apply colorscheme
-- vim.cmd("colorscheme everforest")

-- 額外自訂（可選）
-- 你可以在這裡加入想 override 的顏色或者高亮設定
-- 例如：
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7fbbb3" })

return {}
