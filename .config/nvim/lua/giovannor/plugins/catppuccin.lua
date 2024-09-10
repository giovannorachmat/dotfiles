return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = catppuccin,
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
                integrations = {
                    nvimtree = true,
                },
                custom_highlights = {
                    LineNr= { fg = "#585b70" },
                },
            })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
  } 
}
