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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "swift", "starlark", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end
  },
  {
    'mbbill/undotree',
    keys = { { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Undotree' } },
  },
  'theprimeagen/harpoon',
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
  'f-person/git-blame.nvim',
  'tpope/vim-fugitive',
  {
    'bazelbuild/vim-bazel',
    dependencies = { 'google/vim-maktaba' },
    vscode = false,
  },
}
