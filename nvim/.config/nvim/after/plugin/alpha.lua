-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

-- [[⠀⠀⠀⠀⠸⠉⠐⠂⠤⠤⠤⢤⡄⠤⠄⢚⣭⡲⠒⠒⠒⠀⠤⢀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⢣⠠⣂⠤⠒⢉⢲⠀⠀⠀⠘⠼⠕⠀⠀⠀⠀⠀⠀⠈⠉⠒⠢⠤⢀]],
-- [[⠀⠀⠀⠀⠀⡰⠊⠀⡈⡆⡆⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠]],
-- [[⠀⠀⢀⠠⠜⠐⠀⠀⠁⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁]],
-- [[⢀⢞⣁⣀⣀⠀⠀⠀⠀⠀⠀⠀⠶⣲⣶⣭⣿⣽⣯⣽⣲⢢⠀⠀⠀⢀⡠⠊⠀⠀]],
-- [[⠋⠁⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢫⣿⣫⠀⣀⠔⠉⠀⠀⠀⠀]], 
-- [[⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠞⡋⠔⠊⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⡤⠀⠒⠒⠒⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⢣⠀⠀⠀⠀⡔⠁⠀⠇⡐⠁    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠣⡀⠀⠐⠘⡀⠀⠘⠁  sayu ⣀⢤⡶⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⠈⠑⠠⣀⠈⠂⠤⠤⣤⢔⣞⣀⡠⠔⢈⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⢂⠄⠀⠨⠤⢄⡀⠀⢎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠈⠢⣀⠑⠠⠤⣤⠴⠂⠀⠀⠀⠀]],

[[  ⠀ ／l、  ]],
[[  （ﾟ､ ｡ ７  sa yu]],
[[  ⠀ l、ﾞ ~ヽ  ]],
[[    じしf_, )ノ   ]],

}


dashboard.section.buttons.val = {
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
}

-- 日期和時間（帶圖示）
local function get_datetime()
    local date = os.date("%Y-%m-%d")
    local time = os.date("%H:%M:%S")
    -- 這裡用 emoji 裝飾
    return " " .. date .. "             " .. "󰹱 " .. time
end

dashboard.section.header.opts = {
    position = "center"
}

-- 新增一個 section 來放時間
dashboard.section.datetime = {
    type = "text",
    val = { get_datetime() },
    opts = {
        position = "center",
        hl = "Comment",  -- 文字顏色，可改成 "Title" 或自訂 highlight
    }
}

-- 《Atomic Habits》名言列表
local atomic_quotes = {
    "You do not rise to the level of your goals. You fall to the level of your systems.",
    "Habits are the compound interest of self-improvement.",
    "Every action you take is a vote for the type of person you wish to become.",
    "Be the designer of your world and not merely the consumer of it.",
    "Success is the product of daily habits not once-in-a-lifetime transformations.",
    "Small habits make a big difference when repeated over time.",
    "Focus on the system, not the goal."
}

-- 隨機選一個
math.randomseed(os.time())
dashboard.section.footer.val = atomic_quotes[math.random(#atomic_quotes)]
dashboard.section.footer.opts = { position = "center", hl = "Comment" }


-- 設定 layout
dashboard.config.layout = {
    { type = "padding", val = 13 },
    dashboard.section.header,
    { type = "padding", val = 1 },
    dashboard.section.datetime,   -- 放在 header 下方
    { type = "padding", val = 1 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
}

--- colorscheme
dashboard.section.footer.opts.hl = "Include"
dashboard.section.datetime.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"

-- aligh
dashboard.section.header.opts.position = "center"   -- center / left / right
dashboard.section.buttons.opts.position = "center"
dashboard.section.footer.opts.position = "center"


alpha.setup(dashboard.opts)


