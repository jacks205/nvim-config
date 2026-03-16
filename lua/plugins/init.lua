return {
  -- Startup
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    vscode = false,
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    vscode = false,
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
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "swift", "starlark", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  'mfussenegger/nvim-dap',
  'MDeiml/tree-sitter-markdown',
  'mbbill/undotree',
  -- {
  --   'kylechui/nvim-surround',
  --   version = '*',
  --   config = function()
  --     require('nvim-surround').setup({})
  --   end,
  -- },
  'theprimeagen/harpoon',
  {
    'neanias/everforest-nvim',
    vscode = false,
    config = function()
      require('everforest').setup({})
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
    vscode = false,
    config = function()
      require('dap-go').setup()
    end,
  },
  {
    'nvimdev/guard.nvim',
    dependencies = { 'nvimdev/guard-collection' },
    vscode = false,
  },
  'HiPhish/jinja.vim',
  {
    'bazelbuild/vim-bazel',
    dependencies = { 'google/vim-maktaba' },
    vscode = false,
  },
  -- Disabled inside Cursor/vscode-neovim where Cursor tab completion takes over
  -- (not vim.g.vscode) and { 'github/copilot.vim' } or nil,
}
