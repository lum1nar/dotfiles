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
    --

    [[      へ   ♡    へ_へ ]],
    [[   ૮ - ՛) sayu (- - 7 ]],
    [[    / ⁻  >     < ` ⁻〵 ]],
    [[ 乀(_,ل ل       じし_,)ノ ]],

}

dashboard.section.buttons.val = {
    dashboard.button("r", "  Recently Used Files", ":Telescope oldfiles <CR>"),
    dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
    dashboard.button("p", "  Find Git File", ":Telescope git_files <CR>"),
    dashboard.button("s", "󰊄  Find Text", function()
        local search_term = vim.fn.input("Grep > ")
        require("telescope.builtin").grep_string({ search = search_term })
    end),
    dashboard.button("g", "  Vim Game", ":VimBeGood<CR>"),
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
        hl = "Comment", -- 文字顏色，可改成 "Title" 或自訂 highlight
    }
}

dashboard.section.footer.val = "山高萬仞，只登一步"
dashboard.section.footer.opts = { position = "center", hl = "Comment" }

-- 設定 layout
dashboard.config.layout = {
    { type = "padding", val = 12 },
    dashboard.section.header,
    { type = "padding", val = 1 },
    dashboard.section.datetime, -- 放在 header 下方
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
dashboard.section.header.opts.position = "center" -- center / left / right
dashboard.section.buttons.opts.position = "center"
dashboard.section.footer.opts.position = "center"

alpha.setup(dashboard.opts)
