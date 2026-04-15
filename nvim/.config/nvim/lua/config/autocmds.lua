vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- open neotree when enter buffer
local neotree_open = 0
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if neotree_open then
			return
		end
		neotree_open = 1
		vim.cmd("Neotree show")
	end,
})
