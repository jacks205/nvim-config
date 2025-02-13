-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      defaults = {
        -- layout_config = {
        --   prompt_position = 'top',
        --   horizontal = {
        --     width = 0.9,
        --     height = 0.9,
        --   },
        --   vertical = {
        --     width = 0.9,
        --     height = 0.9,
        --   },
        -- },
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        prompt_prefix = '❯ ',
        selection_caret = '❯ ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
      },
      pickers = {
        -- find_files = {
        --   theme = 'ivy'
        -- },
        live_grep = {
          theme = 'ivy'
        },
        -- git_files = {
        --   theme = 'ivy'
        -- },
        buffers = {
          theme = 'ivy'
        },
      },
      extensions = {
        fzf_native = {}
      }
    }
    require('telescope').load_extension('fzy_native')

    local telescope = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', telescope.find_files)
    -- vim.keymap.set('n', '<leader>fg', telescope.live_grep)
    vim.keymap.set('n', '<leader>fp', function()
      telescope.find_files {
        hidden = true,
        no_ignore = true,
      }
    end)
    vim.keymap.set('n', '<C-p>', telescope.git_files)
    vim.keymap.set('n', '<leader>fb', telescope.buffers)
    vim.keymap.set('n', '<leader>fh', telescope.help_tags)
    vim.keymap.set('n', '<leader>en', function()
      telescope.find_files {
        cwd = vim.fn.stdpath('config')
      }
    end)
    vim.keymap.set('n', '<leader>ed', function()
      telescope.find_files {
        cwd = vim.fn.expand('$HOME/.dotfiles'),
        hidden = true,
      }
    end)
    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)

    require "config.telescope.multigrep".setup()
  end
}
