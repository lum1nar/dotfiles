-- ~/.config/nvim/lua/everforest.lua

-- 官方插件: https://github.com/sainnhe/everforest
-- 若未安裝請先安裝:
-- use { "sainnhe/everforest" }

vim.g.everforest_background = "medium" -- soft / medium / hard
vim.g.everforest_enable_italic = true
vim.g.everforest_enable_bold = true
vim.g.everforest_transparent_background = 0
vim.g.everforest_diagnostic_text_highlight = false
vim.g.everforest_diagnostic_line_highlight = false
vim.g.everforest_diagnostic_virtual_text = "colored"

-- 讓背景更暗一點（可選）
-- vim.g.everforest_better_performance = 1

-- Apply colorscheme
vim.cmd("colorscheme everforest")

-- 額外自訂（可選）
-- 你可以在這裡加入想 override 的顏色或者高亮設定
-- 例如：
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7fbbb3" })

return {}
