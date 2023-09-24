local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
vim.keymap.set('n', '<leader>frc', function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

require("telescope").setup {
  extensions = {
    repo = {
      list = {
        fd_opts = {
          "--no-ignore-vcs",
          "--ignore-file=~/.fdignore",
        },
        search_dirs = {
          "~/Development",
          "/Users/ian.jackson",
        },
      },
    },
  },
}

require("telescope").load_extension "repo"
