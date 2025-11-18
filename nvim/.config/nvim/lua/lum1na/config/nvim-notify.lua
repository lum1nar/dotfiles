require("notify").setup({
    -- 選項範例
    fps = 60,
    timeout = 3000,
    stages = "fade",
    background_colour = "#EA9d34"
})

-- 將全域通知改成 nvim-notify
vim.notify = require("notify")
