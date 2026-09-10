-- Workaround for vscode-neovim E95 "Buffer with this name already exists"
-- when symlinks cause duplicate buffer paths. (upstream: vscode-neovim#2601)
if vim.g.vscode then
  local api_tbl = vim.api
  local orig_buf_set_name = api_tbl.nvim_buf_set_name
  rawset(api_tbl, 'nvim_buf_set_name', function(buf, name)
    local ok, err = pcall(orig_buf_set_name, buf, name)
    if ok then return end
    if type(err) == "string" and err:match("E95") then
      local existing = vim.fn.bufnr(name)
      if existing ~= -1 and existing ~= buf then
        vim.api.nvim_buf_delete(existing, { force = true })
        return orig_buf_set_name(buf, name)
      end
    end
    error(err)
  end)
end

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
