return {
"catppuccin/nvim",
name = "catppuccin",
lazy = false,
    config = function()
      local catppuccin = require("catppuccin")


      catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
      }
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
}


