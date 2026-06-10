-- ╭─────────────────────────────────────────────────────╮
-- │                   Neovim 基本設定                    │
-- ╰─────────────────────────────────────────────────────╯

-- 快捷變數定義
local g = vim.g -- 全域變數 (global variables)
local o, opt = vim.o, vim.opt -- 編輯器選項 (o 為單值, opt 支援列表操作)

-- ── 剪貼簿 ──────────────────────────────────────────────
-- 透過 OSC52 協定支援 SSH 遠端剪貼簿
g.clipboard = {
	name = "OSC 52", -- 使用 OSC52 作為剪貼簿後端
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"), -- 系統剪貼簿 (+) 的複製函式
		["*"] = require("vim.ui.clipboard.osc52").copy("*"), -- 選取剪貼簿 (*) 的複製函式
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"), -- 系統剪貼簿 (+) 的貼上函式
		["*"] = require("vim.ui.clipboard.osc52").paste("*"), -- 選取剪貼簿 (*) 的貼上函式
	},
}

-- ── Session ─────────────────────────────────────────────
-- 儲存 session 時保留的項目：緩衝區、當前目錄、折疊、說明頁、分頁、視窗大小
o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"

-- ── 游標 ────────────────────────────────────────────────
opt.cursorline = true -- 啟用當前行高亮
opt.cursorlineopt = { "number" } -- 只高亮行號欄位，不高亮整行背景

-- 游標形狀與閃爍設定（依模式切換）
opt.guicursor = {
	"n-sm:block", -- Normal / Select / 替換模式：方塊游標
	"v:hor50", -- Visual 模式：橫條游標（50% 高度）
	"c-ci-cr-i-ve:ver10", -- Command / Insert / Visual-Ex 模式：細直線游標（10% 寬度）
	"o-r:hor10", -- Operator-pending / Replace 模式：細橫條游標（10% 高度）
	"a:Cursor/Cursor-blinkwait1-blinkon1-blinkoff1", -- 所有模式：使用 Cursor 高亮，啟用閃爍
}

-- ── 捲動 ────────────────────────────────────────────────
o.scrolloff = 30 -- 游標上下方至少保留 30 行的捲動緩衝
o.sidescrolloff = 5 -- 游標左右方至少保留 5 欄的水平捲動緩衝
opt.smoothscroll = true -- 啟用原生平滑捲動（取代 neoscroll.nvim 外掛）

-- ── 行號 ────────────────────────────────────────────────
opt.number = true -- 顯示絕對行號
opt.relativenumber = true -- 顯示相對行號（方便使用 [count]j/k 跳行）
o.numberwidth = 3 -- 行號欄寬設為 3（覆蓋先前的 2）

-- ── 縮排與 Tab ───────────────────────────────────────────
opt.tabstop = 2 -- 一個 Tab 顯示為 2 個空格寬
opt.expandtab = true -- 輸入 Tab 時自動轉換為空格
o.shiftwidth = 0 -- 自動縮排寬度跟隨 tabstop（設為 0 表示繼承）
o.softtabstop = -1 -- 插入模式的 Tab 寬度跟隨 shiftwidth（設為 -1 表示繼承）
opt.smartindent = true -- 啟用智慧自動縮排

-- ── 分割視窗 ─────────────────────────────────────────────
o.splitbelow = true -- 水平分割時，新視窗開在下方
o.splitright = true -- 垂直分割時，新視窗開在右方
o.splitkeep = "screen" -- 分割時保持畫面內容位置不跳動

-- ── 搜尋 ────────────────────────────────────────────────
opt.ignorecase = true -- 搜尋時忽略大小寫
o.smartcase = true -- 若搜尋詞含大寫字母則自動區分大小寫

-- ── 補全 ────────────────────────────────────────────────
o.pumheight = 15 -- 補全選單最多顯示 15 個項目
-- 補全選單行為：顯示選單、即使只有一個項目也顯示、不自動預選第一項
opt.completeopt = "menu,menuone,noselect"

-- ── 折疊 ────────────────────────────────────────────────
o.foldcolumn = "1" -- 左側折疊欄寬 1 個字元
o.foldenable = false -- 預設不啟用折疊（開檔時不自動折疊）
o.foldlevel = 99 -- 折疊層級設得極高，使所有折疊預設展開

-- ── 復原 ────────────────────────────────────────────────
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- 持久化復原歷史的儲存目錄
opt.undofile = true -- 啟用持久化復原（重開檔案後仍可 undo）

-- ── 備份與暫存 ───────────────────────────────────────────
opt.swapfile = false -- 停用 swap 暫存檔
opt.backup = false -- 停用備份檔

-- ── 視覺化輔助 ───────────────────────────────────────────
opt.termguicolors = true -- 啟用 24-bit 真彩色（需終端機支援）
opt.wrap = false -- 停用自動換行
o.colorcolumn = "+0" -- 在 textwidth 位置顯示欄位提示線（+0 表示與 textwidth 對齊）
o.signcolumn = "yes:1" -- 固定顯示符號欄（寬 1），避免畫面跳動
o.synmaxcol = 1000 -- 只對前 1000 欄進行語法高亮，避免長行卡頓
o.emoji = true -- 將 Emoji 字元視為全形字處理

-- ── 狀態列與命令列 ───────────────────────────────────────
o.laststatus = 3 -- 啟用全域狀態列（所有視窗共用一條狀態列）
o.showcmd = false -- 不在狀態列顯示正在輸入的指令
o.showmode = false -- 不顯示當前模式（如 -- INSERT --），通常由外掛取代
o.cmdheight = 1 -- 命令列高度設為 1 行
o.cmdwinheight = 30 -- 命令列視窗（q:）高度設為 30 行
o.ruler = false -- 停用右下角的游標位置顯示（由狀態列外掛取代）

-- ── 視窗邊框 ─────────────────────────────────────────────
o.winborder = "none" -- 浮動視窗不顯示邊框

-- ── 字元填充 ─────────────────────────────────────────────
-- 自訂各種介面元素所使用的填充字元
opt.fillchars = {
	eob = " ", -- 緩衝區結尾後的空行，以空格取代預設的 "~"
	diff = "╱", -- diff 模式中刪除行的填充字元
	fold = " ", -- 折疊行的填充字元
	foldclose = tools.ui.icons.r_chev, -- 折疊關閉時的圖示（向右箭頭）
	foldopen = tools.ui.icons.d_chev, -- 折疊開啟時的圖示（向下箭頭）
	foldsep = " ", -- 折疊分隔線的填充字元
	msgsep = "━", -- 訊息分隔線
	horiz = "━", -- 水平分割線
	horizup = "┻", -- 水平線向上交叉
	horizdown = "┳", -- 水平線向下交叉
	vert = "┃", -- 垂直分割線
	vertleft = "┫", -- 垂直線向左交叉
	vertright = "┣", -- 垂直線向右交叉
	verthoriz = "╋", -- 垂直與水平線四向交叉
}

-- ── 換行顯示 ─────────────────────────────────────────────
o.breakindent = true -- 啟用換行縮排（超長行折行時維持縮排）
o.breakindentopt = "list:-1" -- 折行縮排選項：配合列表符號對齊

-- ── 列表格式判斷 ──────────────────────────────────────────
-- 定義哪些文字樣式會被 gq 排版指令視為列表項目
opt.formatlistpat = table.concat({
	[[^\s*\d\+[\]:.)}\t ]\s*]], -- 數字列表，如：1. / 1) / 1]
	[[^\s*\w\+[\]:.)}\t ]\s\+]], -- 字母列表，如：a. / a)
	[[^\s*>\s]], -- 引用區塊，如：> 開頭的行
}, [[\|]]) -- 以 \| 分隔（Vim 正規表達式的「或」）

-- ── 訊息提示 ─────────────────────────────────────────────
opt.shortmess:append("s") -- 搜尋時不顯示 "search hit BOTTOM" 等提示訊息
o.confirm = true -- 關閉未儲存的緩衝區時，顯示確認對話框而非直接報錯

-- ── 其他行為 ─────────────────────────────────────────────
opt.hidden = true -- 允許在未儲存的情況下切換緩衝區（緩衝區保留在背景）
opt.mouse = "a" -- 在所有模式下啟用滑鼠支援
opt.timeoutlen = 300 -- 按鍵組合的等待逾時時間（毫秒），影響 which-key 等外掛觸發速度
o.updatetime = 250 -- 游標停止移動後觸發 CursorHold 事件的等待時間（毫秒）
o.redrawtime = 150 -- 語法高亮重繪的最大允許時間（毫秒），超過則停止高亮
o.modeline = false -- 停用 modeline（禁止檔案內嵌入 vim 設定指令，提升安全性）
o.modelines = 0 -- modeline 偵測行數設為 0（徹底停用）
o.nrformats = "alpha" -- Ctrl-A/X 遞增遞減時，支援字母（a→b）而非八進位
o.virtualedit = "all" -- 允許游標移動到沒有實際字元的位置（虛擬編輯模式）
o.fileignorecase = true -- 檔案名稱自動補全時忽略大小寫

-- ── 停用內建 Provider ────────────────────────────────────
g.loaded_node_provider = 0 -- 停用 Node.js provider（不使用 node 外掛）
g.loaded_ruby_provider = 0 -- 停用 Ruby provider
g.loaded_perl_provider = 0 -- 停用 Perl provider

-- ── View 儲存選項 ────────────────────────────────────────
-- 使用 :mkview / :loadview 時儲存的項目
opt.viewoptions = {
	"cursor", -- 儲存游標位置
	"folds", -- 儲存折疊狀態
}
