return require("lazy").setup({

    --------------------------------------------------------------------------- Colorscheme ------------------------------------------------------------------------
    { -- UI 直接載入
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme rose-pine")
            require("lum1na.config.rose-pine")
        end
    },
    {
        "sainnhe/everforest",
        lazy = true,
    },

    ---------------------------------------------------------------------------
    -- Startup screen
    ---------------------------------------------------------------------------
    { -- UI 直接載入
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            require("lum1na.config.alpha")
        end
    },

    ---------------------------------------------------------------------------
    -- Telescope
    ---------------------------------------------------------------------------
    { -- 直接載入
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("lum1na.config.telescope")
        end
    },

    ---------------------------------------------------------------------------
    -- Treesitter
    ---------------------------------------------------------------------------
    { -- 開啟檔案再載入
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        run = ":TSUpdate",
        config = function()
            require("lum1na.config.treesitter")
        end
    },

    { -- 進入 insert mode 載入
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("lum1na.config.nvim-ts-autotag")
        end
    },

    ---------------------------------------------------------------------------
    -- Undo tree
    ---------------------------------------------------------------------------
    { -- 負擔小，直接載入
        "mbbill/undotree",
        config = function()
            require("lum1na.config.undotree")
        end
    },

    ---------------------------------------------------------------------------
    -- LSP / CMP / Snippets
    ---------------------------------------------------------------------------
    { -- 開啟檔案才載入
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",

        event = { "BufReadPre", "BufNewFile" },

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "neovim/nvim-lspconfig", tag = "v2.3.0" },

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        config = function()
            require("lum1na.config.lsp")
            require("lum1na.config.luasnip")
        end
    },

    ---------------------------------------------------------------------------
    -- Copilot
    ---------------------------------------------------------------------------
    { -- Insert Mode 才載入
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            require("lum1na.config.copilot")
        end
    },

    ---------------------------------------------------------------------------
    -- UI / UX plugins
    ---------------------------------------------------------------------------
    {                    -- 開啟 vim 後載入
        "rcarriga/nvim-notify",
        priority = 1000, -- 載入順序很前面
        config = function()
            require("lum1na.config.nvim-notify")
        end
    },

    -- { -- 開啟 vim 後載入
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("lum1na.config.whichkey")
    --     end
    -- },

    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        config = function()
            require("lum1na.config.smear-cursor")
        end
    },

    { -- 視窗滑動才載入
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("lum1na.config.neoscroll")
        end
    },

    ---------------------------------------------------------------------------
    -- Code Runner
    ---------------------------------------------------------------------------
    { -- 負擔小，直接載入
        "CRAG666/code_runner.nvim",
        config = function()
            require("lum1na.config.code_runner")
        end
    },

    ---------------------------------------------------------------------------
    -- Markdown Rendering
    ---------------------------------------------------------------------------
    -- { -- 打開 markdown 才載入
    --     "MeanderingProgrammer/render-markdown.nvim",
    --     ft = { "markdown", "md" },
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     config = function()
    --         require("lum1na.config.render-markdown")
    --     end
    -- },

    ---------------------------------------------------------------------------
    -- CodeCompanion + History
    ---------------------------------------------------------------------------
    { -- 指令輸入才載入
        "olimorris/codecompanion.nvim",
        cmd = {
            "CodeCompanion",
            "CodeCompanionChat",
            "CodeCompanionToggle",
            "CodeCompanionAsk",
        },
        config = function()
            require("lum1na.config.codecompanion")
            require("lum1na.config.fidget-companioncode")
        end,
    },

    { "ravitemer/codecompanion-history.nvim", event = "VeryLazy" },

    ---------------------------------------------------------------------------
    -- File explorers
    ---------------------------------------------------------------------------
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>pt",
                "<cmd>NvimTreeToggle<CR>",
                desc = "Toggle Nvim Tree",
            },
        },
        config = function()
            require("lum1na.config.nvim-tree")
        end,
    },

    { -- 直接載入
        "stevearc/oil.nvim",
        config = function()
            require("lum1na.config.oil")
        end
    },

    ---------------------------------------------------------------------------
    -- Misc
    ---------------------------------------------------------------------------
    { -- 進入 Insertmode 載入
        "m4xshen/autoclose.nvim",
        event = "InsertEnter",
        config = function()
            require("lum1na.config.autoclose")
        end
    },

    -- { "ThePrimeagen/vim-be-good",             cmd = "VimBeGood" },

    { -- 直接載入
        "voldikss/vim-floaterm",
        config = function()
            require("lum1na.config.vim-floaterm")
        end
    },

    { --
        'brianhuster/live-preview.nvim',
        lazy = true,
        keys = {
            {
                "<leader>h",
                function() vim.cmd([[LivePreview start]]) end,
                desc = "Live Preview",
            },
        },

    },

    { "nvimtools/none-ls.nvim",               event = "BufReadPre" },

    ---------------------------------------------------------------------------
    -- Color picker
    ---------------------------------------------------------------------------

    {
        "eero-lehtinen/oklch-color-picker.nvim",
        event = "VeryLazy",
        version = "*",
        keys = {
            -- One handed keymap recommended, you will be using the mouse
            {
                "<leader>v",
                function() require("oklch-color-picker").pick_under_cursor() end,
                desc = "Color pick under cursor",
            },
        },
        ---@type oklch.Opts
        opts = {},
    },

    ---------------------------------------------------------------------------
    -- No Neck Pain
    ---------------------------------------------------------------------------
    -- {
    --     "shortcuts/no-neck-pain.nvim",
    --     version = "*",
    --     config = function()
    --         require("lum1na.config.no-neck-pain")
    --     end,
    --
    -- },

    ---------------------------------------------------------------------------
    -- floating-toc
    ---------------------------------------------------------------------------
    -- {
    --     dir = "~/nvim/myplugin/float-toc",
    --     name = "float-toc"
    -- },

    -------------------------------------------------------------------------
    -- float-toc
    -------------------------------------------------------------------------
    {
        "lum1nar/float-toc.nvim",
        opts = {
            -- your options here
        },
        config = function()
            require("lum1na.config.float-toc")
        end,

    },
    -- {
    --     dir = "~/nvim-plugin/peep.nvim/",
    --     name = "Peep",
    --     config = function()
    --         require("peep").setup({
    --             colors = {
    --                 label_main = { fg = "#A72703", bg = "#FCB53B", },
    --                 label_sub = { fg = "#FCB53B", bg = "#44415a", },
    --                 line_aux = { fg = "#9893a5", },
    --                 line_preview = { fg = "#7aa2f7" }
    --             },
    --
    --             peep = {
    --                 duration = 700,
    --                 column = false,
    --                 auxline_icon = "·",
    --                 key_trigger = true,
    --                 trigger_keys = { "y", "d", "c", "v", "V" },
    --                 line_preview = true
    --             }
    --         })
    --         vim.keymap.set({ "n", "v" }, "<leader><leader>", function() require("peep").peep() end, { desc = "Peep" })
    --     end
    --
    -- },

    {
        "lum1nar/peep.nvim",
        config = function()
            require("peep").setup({
                colors = {
                    label_main = { fg = "#A72703", bg = "#FCB53B", },
                    label_sub = { fg = "#FCB53B", bg = "#44415a", },
                    line_aux = { fg = "#9893a5", },
                    line_preview = { fg = "#7aa2f7" }
                },

                peep = {
                    duration = 700,
                    column = false,
                    auxline_icon = "·",
                    key_trigger = true,
                    trigger_keys = { "y", "d", "c", "v", "V" },
                    line_preview = true
                }
            })
            vim.keymap.set({ "n", "v" }, "<leader><leader>", function() require("peep").peep() end, { desc = "Peep" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            require("lum1na.config.nvim-treesitter-textobjects")
        end,
    }

})
