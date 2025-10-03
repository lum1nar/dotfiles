local lsp = require('lsp-zero').preset({
  name = 'minimal' ,
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})



-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

vim.o.updatetime = 500 -- 停留多久觸發 (毫秒)，預設 4000ms 太久了
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to the definition of function or varialbe under curosr" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find references for the code under cursor" })


lsp.setup()

