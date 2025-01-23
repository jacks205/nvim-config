return {
  -- Startup
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  'mfussenegger/nvim-dap',
  'MDeiml/tree-sitter-markdown',
  'mbbill/undotree',
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup({})
    end,
  },
  'theprimeagen/harpoon',
  {
    'neanias/everforest-nvim',
    config = function()
      require('everforest').setup()
      require('everforest').load()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        separator = '-',
      })
    end,
  },
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup()
    end,
  },
  'terryma/vim-multiple-cursors',
  'theprimeagen/git-worktree.nvim',
  'f-person/git-blame.nvim',
  'tpope/vim-fugitive',
  {
    'olexsmir/gopher.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'dreamsofcode-io/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end,
  },
  {
    'nvimdev/guard.nvim',
    dependencies = { 'nvimdev/guard-collection' },
  },
  'HiPhish/jinja.vim',
  {
    'bazelbuild/vim-bazel',
    dependencies = { 'google/vim-maktaba' },
  },
  'github/copilot.vim',
}
