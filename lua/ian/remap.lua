vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


--- Insert line above and below cursor
vim.keymap.set('n', '<leader>gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
vim.keymap.set('n', '<leader>go', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])
