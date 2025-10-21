require("notify").setup({
    -- 選項範例
    fps = 60,
    timeout = 1000,
    stages = "fade",
})

-- 將全域通知改成 nvim-notify
vim.notify = require("notify")
