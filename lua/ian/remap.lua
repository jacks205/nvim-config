vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Appends line below to current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in middle on half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Insert line above and below cursor
vim.keymap.set('n', '<leader>gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
vim.keymap.set('n', '<leader>go', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

-- pastes current register line below
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy current selection
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Start new tmux session from folder list
vim.keymap.set('n', '<C-f>', '<cmd>silent iterm-newtab<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>f', vim.lsp.buf.format)

-- Exits interactive mode
vim.keymap.set('i', '<C-c>', '<Esc>')

--- Goes to next character and enters interactive mode.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quick save
vim.keymap.set('n', "<C-s>", ":w<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- switch buffers
vim.keymap.set("n", "<leader>k", "<cmd>bn<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>bp<CR>zz")

-- make current file executable permissions
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Switch between files
vim.keymap.set("n", "<Tab>", "<C-^>")

-- Set delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", "_d")
