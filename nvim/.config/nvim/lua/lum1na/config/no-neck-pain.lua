require("no-neck-pain").setup({
    width = 100,
    autocmds = {
        enableOnVimEnter = true,
    },
    buffers = {
        colors = {
            -- background = "#fcf1e1",
            -- blend = -0.025,
        }
    },
    integrations = {
        NvimTree = {
            position = "left",
            reopen = true,
        },
        undotree = {
            position = "left",
        },
    }
})
