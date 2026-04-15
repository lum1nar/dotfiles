return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	opts = {
		display = {
			chat = {
				auto_scroll = false,
				window = {
					buflisted = false, -- List the chat buffer in the buffer list?
					sticky = false, -- Chat window follows when switching tabs

					layout = "vertical", -- float|vertical|horizontal|tab|buffer
					full_height = true, -- for vertical layout
					position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
					-- NOTE: You can set these to 0 for auto width/height

					width = 0.35, ---@return number|fun(): number
					height = 0.8, ---@return number|fun(): number

					border = "single",
					relative = "editor",

					-- Ensure that long paragraphs of markdown are wrapped
					opts = {
						breakindent = true,
						linebreak = true,
						wrap = true,
					},
				},
			},
		},
		interactions = { chat = {
			adapter = "openrouter",
			adapter = "openrouter",
		}, inline = {} },
		adapters = {
			http = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = "OPENROUTER_API_KEY",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "google/gemini-3-flash-preview",
							},
						},
					})
				end,
			},
		},

		-- interactions = {
		-- 	chat = {
		-- 		adapter = "deepseek",
		-- 		model = "deepseek-reasoner",
		-- 	},
		-- },
	},
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			desc = "AI Actions",
		},
		{
			"<leader>a",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "AI Chat Toggle",
		},
		-- {
		-- 	"<leader>av",
		-- 	"<cmd>CodeCompanionChat Add<cr>",
		-- 	mode = "v",
		-- 	desc = "Paste Selection to Chat Buffer",
		-- },
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr><esc>",
			mode = "v",
			desc = "Paste Selection to Chat Buffer",
		},
	},
}
