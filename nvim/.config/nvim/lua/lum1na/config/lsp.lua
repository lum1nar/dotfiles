-- ==================================================
-- LSP-ZERO SETUP
-- ==================================================
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- ==================================================
-- Mason + LSP 安裝設定
-- ==================================================

-- Auto Install LSP, linter and formatter
require('mason').setup()
local servers = {
    'bashls',   -- bash-language-server
    'pyright',  -- python
    'clangd',   -- c
    'lua_ls',   -- lua-language-server
    'marksman', -- markdown formatter
    'ts_ls',    -- typescript-language-server
}

local linter_formatters = {
    'black',    -- python
    'prettier', -- markdown
}

require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
})

require("mason-tool-installer").setup({
    ensure_installed = linter_formatters,
    auto_update = true,
    run_on_start = true,
    automatic_installation = true,
})

-- ==================================================
-- Formatter via none-ls (for servers that don't support it)
-- ==================================================
local none_ls = require("null-ls")

-- 這裡列出常用 formatter
local formatting_sources = {
    -- Python
    none_ls.builtins.formatting.black,
    -- none_ls.builtins.formatting.isort,

    -- Markdown
    none_ls.builtins.formatting.prettier.with({
        filetypes = { "markdown" },
    }),
}

none_ls.setup({
    sources = formatting_sources,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.js", "*.lua", "*.c" },
    callback = function()
        vim.lsp.buf.format({ async = false })
        vim.cmd([[%s/\n\{2,\}/\r\r/e]]) -- Remove Empty Lines
        -- \r -> newline
        -- \e -> ignore errors
    end,
})

-- Keymap for format code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code" })

-- ==================================================
-- LSP DEBUG SESSION
-- ==================================================

-- Keymap for debug
vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>",
    { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.lsp.buf.definition()<CR>",
    { desc = "Go to the definition of function or varialbe under curosr" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua vim.lsp.buf.references()<CR>",
    { desc = "Find references for the code under cursor" })

-- Show debug error
vim.o.updatetime = 500 -- 停留多久觸發 (毫秒)，預設 4000ms 太久了
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

lsp.setup()
