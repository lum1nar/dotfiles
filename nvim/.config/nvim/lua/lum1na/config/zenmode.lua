require("zen-mode").setup {
    window = { backdrop = 0.99, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal height and width can be: * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 80, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
            -- signcolumn = "no", -- disable signcolumn
            number = true,         -- disable number column
            relativenumber = true, -- disable relative numbers
            cursorline = false,    -- disable cursorline cursorcolumn = false,  -- disable cursor column foldcolumn = "0", -- disable fold column list = false, -- disable whitespace characters
        },
    },
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false,  -- disables the ruler text in the cmd line area
            showcmd = true, -- disables the command in the last line of the screen
            -- you may turn on/off statusline in zen mode by setting 'laststatus'
            -- statusline will be shown only if 'laststatus' == 3
            laststatus = 3,        -- turn off the statusline in zen mode
        },
        tmux = { enabled = true }, -- disables the tmux statusline
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function()
    end,
    on_close = function()
    end, }

vim.keymap.set("n", "<leader><leader>", require("zen-mode").toggle, { desc = "Toggle Zen Mode" })
-- vim.api.nvim_create_autocmd(
--     { "VimEnter", "BufReadPost" },
--     {
--         pattern = "*",
--         callback = function()
--             vim.defer_fn(
--                 function()
--                     -- 避免進入空 buffer 或 dashboard 時誤觸
--                     local bufname = vim.api.nvim_buf_get_name(0)
--                     if bufname ~= "" then
--                         require("zen-mode").open()
--                     end
--                 end, 1)
--         end,
--     })
