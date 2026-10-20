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
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "c", "lua", "vim", "vimdoc", "query", "swift", "starlark", "elixir", "heex", "javascript", "html",
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      })
      local select = require("nvim-treesitter-textobjects.select").select_textobject
      for key, query in pairs({
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
      }) do
        vim.keymap.set({ "x", "o" }, key, function() select(query, "textobjects") end)
      end
      vim.keymap.set({ "x", "o" }, "as", function() select("@local.scope", "locals") end)
    end,
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
