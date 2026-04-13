return {
	"goolord/alpha-nvim",
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[      へ   ♡    へ_へ ]],
			[[   ૮ - ՛) sayu (- - 7 ]],
			[[    / ⁻  >     < ` ⁻〵 ]],
			[[ 乀(_,ل ل       じし_,)ノ ]],
		}

		local fzf = require("fzf-lua")

		dashboard.section.buttons.val = {
			dashboard.button("r", "  Recently Used Files", "<CMD>FzfLua combine pickers=buffers;oldfiles<CR>"),
			dashboard.button("f", "  Find File", "<CMD>FzfLua files<CR>"),
			dashboard.button("p", "  Find Git File", "<CMD>FzfLua git_files<CR>"),
			dashboard.button("g", "󰊄  Find Text", "<CMD>FzfLua live_grep<CR>"),
			dashboard.button("n", "  NeoTree", "<CMD>Neotree show<CR>"),
			dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
		}

		-- layout
		dashboard.config.layout = {
			{ type = "padding", val = 12 },
			dashboard.section.header,
			{ type = "padding", val = 1 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
		}

		--- colorscheme
		dashboard.section.buttons.opts.hl = "Keyword"

		-- aligh
		dashboard.section.header.opts.position = "center" -- center / left / right
		dashboard.section.buttons.opts.position = "center"

		alpha.setup(dashboard.opts)

		-- open neotree in alpha screen
		vim.schedule(function()
			vim.cmd("Neotree show")
		end)
	end,
}
