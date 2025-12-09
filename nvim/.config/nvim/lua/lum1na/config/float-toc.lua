require("float-toc").setup({
    bullet_icon = "⁍",
    indent_width = 4,
})

vim.keymap.set("n", "<leader>t", "<cmd>FloatTOC<cr>")
