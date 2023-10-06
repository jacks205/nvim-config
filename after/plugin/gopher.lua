require("gopher").setup {
  -- commands = {
  --   go = "go",
  --   gomodifytags = "gomodifytags",
  --   gotests = "gotests", -- also you can set custom command path
  --   impl = "impl",
  --   iferr = "iferr",
  -- },
}

vim.keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json <CR>")
vim.keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml <CR>")

vim.cmd [[silent! GoInstallDeps]]
