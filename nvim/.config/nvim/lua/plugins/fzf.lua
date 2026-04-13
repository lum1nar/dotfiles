return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>ca",
			function()
				require("fzf-lua").lsp_code_actions()
			end,
			desc = "code action",
			mode = { "n", "v" },
		},
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "find references",
		},
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select()
	end,
	opts = {
		"default-title",
		fzf_opts = {
			["--layout"] = "reverse",
		},
		winopts = {
			height = 0.80,
			width = 0.87,
			preview = {
				horizontal = "right:55%",
			},
		},
		files = {
			follow = true, -- do not follow symlinks by default
		},
		oldfiles = {
			include_current_session = true, -- include bufs from current session
		},
		keymap = {
			fzf = {
				["tab"] = "down",
				["shift-tab"] = "up",
			},
		},
		fzf_colors = {
			true, -- inherit fzf colors that aren't specified below from
			-- the auto-generated theme similar to `fzf_colors=true`
			["fg"] = { "fg", "CursorLine" },
			["bg"] = { "bg", "Normal" },
			["hl"] = { "fg", "Comment" },
			["fg+"] = { "fg", "Normal", "underline" },
			["bg+"] = { "bg", { "CursorLine", "Normal" } },
			["hl+"] = { "fg", "Statement" },
			["info"] = { "fg", "PreProc" },
			["prompt"] = { "fg", "Conditional" },
			["pointer"] = { "fg", "Exception" },
			["marker"] = { "fg", "Keyword" },
			["spinner"] = { "fg", "Label" },
			["header"] = { "fg", "Comment" },
			["gutter"] = "-1",
		},
	},
}
