require('code_runner').setup({
    mode = "float",
    float = {
        close_key = "<ESC>",
        -- Window border (see ':h nvim_open_win')
        border = "rounded",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
    },
    filetype = {
        java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = {
            "cd &dir &&",
            "tsc $fileName &&",
            "node $fileNameWithoutExt.js"
        },
        rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt"
        },
        c = {
            "cd $dir &&",
            "gcc $fileName -o",
            "/tmp/$fileNameWithoutExt",
            "&& /tmp/$fileNameWithoutExt &&",
            "rm /tmp/$fileNameWithoutExt",
        },
    },
})

vim.api.nvim_set_keymap("n", "<leader>r", ":w<CR>:RunCode<CR>i", { noremap = true, silent = true, desc = "Run code" })
