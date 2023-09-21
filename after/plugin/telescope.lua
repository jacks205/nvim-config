local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', function()
    require('telescope').extensions.repo.list{}
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
          "~/.dotfiles",
        },
      },
    },
  },
}

require("telescope").load_extension "repo"
