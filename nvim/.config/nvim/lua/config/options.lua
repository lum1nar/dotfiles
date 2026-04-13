-- shortcuts
local g = vim.g -- global variables
local opt = vim.opt -- editor options

-- set leader key to Space
g.mapleader = " "

-- ssh clipboard support through OSC52
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

-- enable current line highlighting
opt.cursorline = true

-- disable line wrapping
opt.wrap = false

-- set maximum amount of completion items to 10
opt.pumheight = 10

-- complete even if there's only one item; do not autoselect item
opt.completeopt = "menu,menuone,noselect"

-- set minimal number of screeen lines above and below cursor
opt.scrolloff = 8

-- undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- native smooth scrolling (replaces neoscroll.nvim)
opt.smoothscroll = true

-- make splits open to down and right
opt.splitbelow = true
opt.splitright = true

-- disable providers
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- number stuff
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- tab stuff
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

opt.shortmess:append("s")

-- enable terminal colors
opt.termguicolors = true

-- disable swap
opt.swapfile = false
opt.backup = false

opt.cmdheight = 1
opt.hidden = true
opt.ignorecase = true

opt.mouse = "a"
opt.smartindent = true
opt.timeoutlen = 300
opt.ruler = false
opt.updatetime = 250

-- nice confirmation dialog
opt.confirm = true
vim.o.winborder = "rounded"

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:/]]
