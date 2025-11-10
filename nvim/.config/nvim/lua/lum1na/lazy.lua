return require("lazy").setup({

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                            , branch = "0.1.x",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("lum1na.config.telescope")
        end
    },

    {
        "sainnhe/everforest",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("lum1na.config.treesitter")
        end
    },

    {
        "mbbill/undotree",

        config = function()
            require("lum1na.config.undotree")
        end
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
            { "neovim/nvim-lspconfig",                    tag = "v2.3.0" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },

        config = function()
            require("lum1na.config.lsp")
            require("lum1na.config.luasnip")
        end
    },

    {
        "github/copilot.vim",
        tag = "v1.55.0",

        config = function()
            require("lum1na.config.copilot")
        end
    },

    { "ThePrimeagen/vim-be-good" },

    {
        "folke/zen-mode.nvim",
        config = function()
            require("lum1na.config.zenmode")
        end
    },

    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("lum1na.config.autoclose")
        end
    },

    {
        "CRAG666/code_runner.nvim",
        config = function()
            require("lum1na.config.code_runner")
        end

    },

    {
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            require("lum1na.config.alpha")
        end
    },

    {
        "m4xshen/hardtime.nvim",
        config = function()
            require("lum1na.config.hardtime")
        end
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            require("lum1na.config.nvim-notify")
        end
    },

    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            require("lum1na.config.whichkey")
        end
    },

    {
        "rose-pine/neovim",
        config = function()
            vim.cmd("colorscheme rose-pine")
            require("lum1na.config.rose-pine")
        end
    },

    {
        "olimorris/codecompanion.nvim",
        tag = "v17.26.0",
        config = function()
            require("lum1na.config.codecompanion")
            require("lum1na.config.fidget-companioncode")
        end
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",

        config = function()
            require("lum1na.config.render-markdown")
        end
    },

    {
        "sphamba/smear-cursor.nvim",
        config = function()
            require("lum1na.config.smear-cursor")
        end
    },

    {
        "karb94/neoscroll.nvim",
        config = function()
            require("lum1na.config.neoscroll")
        end
    },

    { "ravitemer/codecompanion-history.nvim" },

    { "nvimtools/none-ls.nvim" },

    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("lum1na.config.nvim-ts-autotag")
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("lum1na.config.nvim-tree")
        end
    },

    {
        "stevearc/oil.nvim",
        config = function()
            require("lum1na.config.oil")
        end

    },

    {
        'brianhuster/live-preview.nvim',
    },

    {
        'voldikss/vim-floaterm',
        config = function()
            require('lum1na.config.vim-floaterm')
        end
    },

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
    }
})
