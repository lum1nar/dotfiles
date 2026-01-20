vim.g.mapleader = " "

-- When in visual mode, pressing J will move the selected lines down by one line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't get disoriented when jumping half a page up or down vim.keymap.set("n", "<C-d>", "<C-d>zz") vim.keymap.set("n", "<C-u>", "<C-u>zz") vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank thorugh OSC52" })
vim.keymap.set("n", "Q", "<nop>")

-- Create a new Obsidian note with template
vim.keymap.set("n", "<leader>nc", function()
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
end, { desc = "Create New Note" })
