return {
	-- Local checkout for testing; revert to "sudo-tee/opencode.nvim" when done.
	-- dir = vim.fn.expand("~/clone/opencode.nvim"),
	"sudo-tee/opencode.nvim",
	lazy = false,
	dependencies = {
		-- Optional: choose a picker you already use, or keep vim.ui.select.
		-- 'folke/snacks.nvim',
		-- 'nvim-telescope/telescope.nvim',
		-- 'ibhagwan/fzf-lua',
		-- 'nvim-mini/mini.pick',
		-- Optional: use your configured completion engine, or built-in completion.
		-- 'saghen/blink.cmp',
		-- 'hrsh7th/nvim-cmp',
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			},
			ft = { "markdown", "opencode_output" },
		},
	},
	opts = {},
	-- config = function(_, opts)
	-- 	require("opencode").setup(opts)
	-- 	-- render-markdown resolves code fences via the buffer filetype's treesitter
	-- 	-- language; map it so opencode_output fences render and highlight.
	-- 	vim.treesitter.language.register("markdown", "opencode_output")
	-- end,
}
