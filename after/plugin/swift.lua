local lspconfig = require("lspconfig")
local opts = { noremap = true, silent = true }
lspconfig.sourcekit.setup {
    on_attach = function(_, bufnr)
      opts.buffer = bufnr
      opts.desc = "Show line diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
    cmd = {
        "/Applications/Xcode-15.0.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
    },
    root_dir = function(filename, _)
        return lspconfig.util.find_git_ancestor(filename)
    end,
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "swift", "m", "h", "c" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
        vim.opt_local.smartindent = false
        vim.opt_local.autoindent = true
        vim.opt_local.smarttab = true
    end,
})
