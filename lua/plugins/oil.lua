return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      local mini = require('mini.icons')
      local oil = require('oil')
      oil.setup {

        view_options = {
          show_icons = true,
          show_hidden = true,
        }
      }
      mini.setup()
    end,
    keys = {
      { "<leader>o", mode = { "n", "x", "o" }, function() require("oil").open() end, desc = "Oil" },
      { "-",         mode = { "n", "x", "o" }, function() require("oil").open() end, desc = "Oil" },
    }
  }
}
