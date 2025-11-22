return require("lazy").setup({

    ---------------------------------------------------------------------------
    -- Colorscheme
    ---------------------------------------------------------------------------
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
    { -- 開啟 vim 後載入
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("lum1na.config.nvim-notify")
        end
    },

    { -- 開啟 vim 後載入
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("lum1na.config.whichkey")
        end
    },

    { -- 直接載入
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("lum1na.config.zenmode")
        end
    },

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
    { -- 打開 markdown 才載入
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "md" },
        config = function()
            require("lum1na.config.render-markdown")
        end
    },

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
    { -- 直接載入
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lum1na.config.nvim-tree")
        end
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

    { "ThePrimeagen/vim-be-good",             cmd = "VimBeGood" },

    { -- 直接載入
        "voldikss/vim-floaterm",
        config = function()
            require("lum1na.config.vim-floaterm")
        end
    },

    { --
        'brianhuster/live-preview.nvim',
        event = "VeryLazy",
        config = function()
            require('lum1na.config.live-preview')
        end
    },

    { "nvimtools/none-ls.nvim", event = "BufReadPre" },

    ---------------------------------------------------------------------------
    -- Color picker
    ---------------------------------------------------------------------------
    { -- vim 開啟後載入
        "eero-lehtinen/oklch-color-picker.nvim",
        keys = {
            {
                "<leader>v",
                function() require("oklch-color-picker").pick_under_cursor() end,
                event = "VeryLazy",
                desc = "Color pick under cursor",
            },
        },
        opts = {},
    },

})
