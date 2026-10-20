-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  vscode = false,
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' }
  },
  config = function()
    local nmap = require('ian.utils').nmap
    require('telescope').setup {
      defaults = {
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        prompt_prefix = '❯ ',
        selection_caret = '❯ ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
      },
      pickers = {
        live_grep = {
          theme = 'ivy'
        },
        buffers = {
          theme = 'ivy'
        },
      },
    }
    require('telescope').load_extension('fzy_native')

    local telescope = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', telescope.find_files)
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
        cwd = vim.fn.expand('$HOME/Development/dotfiles'),
        hidden = true,
      }
    end)
    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)
    nmap('<leader>rr', "<cmd>Telescope keymaps<CR>", 'Show Keymaps [RR]')

    require "config.telescope.multigrep".setup()
  end
}
