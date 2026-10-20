local M = {}
M.nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc and ('LSP: ' .. desc) })
end

return M
