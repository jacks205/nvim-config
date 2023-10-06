-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- startup
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    use 'cljoly/telescope-repo.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use { "folke/trouble.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
    use("nvim-treesitter/playground")
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use 'mfussenegger/nvim-dap'
    use('MDeiml/tree-sitter-markdown')
    use('iamcco/markdown-preview.nvim')
    use("mbbill/undotree")
    use("folke/zen-mode.nvim")
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    --    use({"numirias/semshi", run = ":UpdateRemotePlugins"})
    use("theprimeagen/harpoon")
    use('HiPhish/jinja.vim')
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })
    use({
        "neanias/everforest-nvim",
        config = function()
            require("everforest").setup()
            require("everforest").load()
        end,
    })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'treesitter-context'.setup {
                separator = '-'
            }
        end
    }
    use { 'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup()
        end
    }
    use { 'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
        end
    }
    -- use 'terryma/vim-multiple-cursors'
    use 'mg979/vim-visual-multi'
    -- git
    use 'theprimeagen/git-worktree.nvim'
    use 'f-person/git-blame.nvim'
    use("tpope/vim-fugitive")
    use "airblade/vim-gitgutter"
    -- golang
    use { 'olexsmir/gopher.nvim',
        requires = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }
    use { 'dreamsofcode-io/nvim-dap-go',
        config = function()
            require 'dap-go'.setup()
        end }
    -- python
    use { "nvimdev/guard.nvim", requires = { "nvimdev/guard-collection" } }
end)
