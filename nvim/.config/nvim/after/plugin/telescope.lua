require('telescope').setup{
  defaults = {
    -- 如果你也想忽略 .git/ 底下的檔案，可以加這行
    file_ignore_patterns = {".git/"},
  },
  pickers = {
    find_files = {
      hidden = true,   -- 開啟隱藏檔案
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = 'Telecope recent files' })
-- vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', function()
	local search_term = vim.fn.input("Grep > ")
	builtin.grep_string({search = search_term});
end)
