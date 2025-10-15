vim.notify = require("notify"), -- use notify for messages

require("hardtime").setup({
    -- I need my hjkl smooth
    restricted_keys = {
        ["h"] = false,
        ["j"] = false,
        ["k"] = false,
        ["l"] = false,
        ["+"] = { "n", "x" },
        ["gj"] = { "n", "x" },
        ["gk"] = { "n", "x" },
        ["<C-M>"] = { "n", "x" },
        ["<C-N>"] = { "n", "x" },
        ["<C-P>"] = { "n", "x" },
    },
    disable_mouse = false, -- Enalbe mouse support
}
)






