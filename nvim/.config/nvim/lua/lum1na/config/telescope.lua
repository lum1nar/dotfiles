require('telescope').setup {
    defaults = {
        -- 如果你也想忽略 .git/ 底下的檔案，可以加這行
        file_ignore_patterns = { ".git/" },
    },
    pickers = {
        find_files = {
            hidden = true, -- 開啟隱藏檔案
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = 'Find Recent Files' })
vim.keymap.set('n', '<leader>pp', builtin.git_files, { desc = 'Find Git files' })
vim.keymap.set('n', '<leader>pn', function()
    builtin.live_grep({ cwd = "~/obsidian/4 - 筆記/" })
end, { desc = 'Find Obsidain Notes' })

vim.keymap.set('n', '<leader>ps', function()
    local search_term = vim.fn.input("Grep > ")
    builtin.grep_string({ search = search_term })
end, { desc = 'Telescope Search Files Containing Given Text' }

)
