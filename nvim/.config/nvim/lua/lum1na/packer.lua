-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'sainnhe/everforest',
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'mbbill/undotree'

    use {
        "neovim/nvim-lspconfig",
        tag = "v2.3.0"
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use {
        'github/copilot.vim',
        tag = 'v1.55.0',

    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use 'ThePrimeagen/vim-be-good'

    use 'folke/zen-mode.nvim'

    use 'm4xshen/autoclose.nvim'

    use 'CRAG666/code_runner.nvim'

    use 'https://github.com/goolord/alpha-nvim'

    use 'm4xshen/hardtime.nvim'

    use 'rcarriga/nvim-notify'

    use 'folke/which-key.nvim'

    use 'norcalli/nvim-colorizer.lua'

    use {
        "rose-pine/neovim",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }

    use {
        'olimorris/codecompanion.nvim',
        tag = "v17.26.0"
    }

    use "MeanderingProgrammer/render-markdown.nvim"

    use "sphamba/smear-cursor.nvim"

    use 'karb94/neoscroll.nvim'

    use 'ravitemer/codecompanion-history.nvim'

    use 'nvimtools/none-ls.nvim'

    use 'windwp/nvim-ts-autotag'
end)
