require('render-markdown').setup({
    file_types = { "markdown", "codecompanion" },  -- 正確的參數名和小寫
    render_modes = { 'n', 'c', 'i', 'v' },  -- 陣列形式,不是 boolean
    sign = {
        enabled = false,
    },
})
