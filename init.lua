require('config.lazy')
require("ian")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.g.netrw_keepdir = 0
-- vim.g.python3_host_prog="~/.pyenv/shims/python"
--
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
