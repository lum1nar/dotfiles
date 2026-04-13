local wk = require("which-key")
local utils = require("utils")

-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize window using <Shift+> arrow keys
vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>")

-- Switch buffers with tab
vim.keymap.set("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Copy to clipboard (works in ssh)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank thorugh OSC52" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Open filetree
vim.keymap.set("n", "<C-n>", "<CMD>Neotree toggle<CR>")

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without losing register in visual mode
vim.keymap.set("x", "p", "P")

-- Quickfix navigation
vim.keymap.set("n", "]q", "<CMD>cnext<CR>")
vim.keymap.set("n", "[q", "<CMD>cprev<CR>")

-- Diagnostic navigation (without leader)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "prev diagnostic" })

local function createNote()
	-- Ask for filename
	local name = vim.fn.input("New note name: ")
	if name == nil or name == "" then
		print("Canceled")
		return
	end

	-- [[]] is multiple-line string
	local template = ([[
%s

標籤 :

參考資料

    ]]):format(os.date("%Y-%m-%d %H:%M"))

	-- Expand ~
	local dir = vim.fn.expand("~/obsidian/4 - 筆記/")
	local filepath = dir .. name .. ".md"

	-- write template
	-- 1st parameter of writeFile should be an array of strings
	-- so we use vim.split to create the array
	vim.fn.writefile(vim.split(template, "\n"), filepath)

	-- Open the file
	vim.cmd("edit " .. filepath)
end

vim.keymap.set("n", "<leader>nc", createNote, { desc = "Create New Note" })

wk.add({
	{ "<leader>b", group = "buffer" },
	{ "<leader>bc", "<CMD>BufferLineCloseOthers<CR>", desc = "delete all buffers but current" },
	{ "<leader>bd", "<CMD>bp|bd #<CR>", desc = "delete buffer" },
	{ "<leader>bp", "<CMD>BufferLineTogglePin<CR>", desc = "pin buffer" },
	{ "<leader>bl", "<CMD>BufferLineMoveNext<CR>", desc = "move buffer right" },
	{ "<leader>bh", "<CMD>BufferLineMovePrev<CR>", desc = "move buffer left" },
	{ "<leader>f", group = "file" },
	{ "<leader>ff", "<CMD>FzfLua files<CR>", desc = "find file" },
	{ "<leader>fp", "<CMD>FzfLua git_files<CR>", desc = "find project file" },
	{ "<leader>fg", "<CMD>FzfLua live_grep<CR>", desc = "find project file with live_grep" },
	{
		"<leader>fn",
		function()
			require("fzf-lua").live_grep({
				cwd = vim.fn.expand("~/obsidian/4 - 筆記/"),
			})
		end,
		desc = "find notes",
	},
	{ "<leader>ft", "<CMD>FloatTOC<CR>", desc = "Toggle Floating TOC" },
	{ "<leader>fr", "<CMD>FzfLua combine pickers=buffers;oldfiles<CR>", desc = "open recent file" },
	{ "<leader>h", group = "help" },
	{ "<leader>hc", "<CMD>FzfLua commands<CR>", desc = "commands" },
	{ "<leader>hh", "<CMD>:checkhealth<CR>", desc = "check health" },
	{ "<leader>hk", "<CMD>FzfLua keymaps<CR>", desc = "keymaps" },
	{ "<leader>hp", "<CMD>Lazy<CR>", desc = "package manager" },
	{ "<leader>hs", "<CMD>FzfLua highlights<CR>", desc = "search highlight groups" },
	{ "<leader>g", group = "git" },
	{ "<leader>gc", "<CMD>FzfLua git_commits<CR>", desc = "commits" },
	{ "<leader>gs", "<CMD>FzfLua git_status<CR>", desc = "status" },
	{ "<leader>n", group = "filetree" },
	{ "<leader>nn", "<CMD>Neotree<CR>", desc = "file explorer" },
	{ "<leader>nr", "<CMD>Neotree reveal<CR>", desc = "reveal" },
	{ "<leader>s", group = "search" },
	{ "<leader>sb", "<CMD>FzfLua blines<CR>", desc = "buffer" },
	{ "<leader>sg", "<CMD>FzfLua live_grep<CR>", desc = "grep" },
	{ "<leader>sh", "<CMD>FzfLua command_history<CR>", desc = "command history" },
	{ "<leader>sm", "<CMD>FzfLua marks<CR>", desc = "jump to mark" },
	{ "<leader>ss", utils.lsp_document_symbols, desc = "goto symbol" },
	{ "<leader>w", group = "window" },
	{ "<leader>ws", "<C-W>s", desc = "split below" },
	{ "<leader>wv", "<C-W>v", desc = "split right" },
	{ "<leader>w=", "<C-W>=", desc = "balance" },
	{ "<leader>wd", "<C-W>c", desc = "delete window" },
	{ "<leader>ww", "<C-W>p", desc = "other window" },
	{ "<leader>c", group = "code" },
	{ "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "toggle undo tree" },
	{ "<leader>x", group = "trouble" },
	{ "<leader>a", group = "ai" },
})
