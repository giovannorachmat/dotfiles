return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavor = "mocha",
                transparent_background = true,
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
    -- {
    --   "rose-pine/neovim",
    --   name = "rose-pine",
    --   priority = 1000,
    --   lazy = false,
    --   config = function()
    --     require("rose-pine").setup({
    --     })
    --
    --     vim.cmd.colorscheme("rose-pine")
    --   end
    -- },
    --   {
    --   "vague2k/vague.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   name = "vague",
    --   config = function()
    --     require("vague").setup({
    --       transparent = true,
    --     })
    --
    --     vim.cmd.colorscheme("vague")
    --   end,
    -- }
    -- {
    --     "shaunsingh/moonlight.nvim",
    --     name = "moonlight",
    --     config = function()
    --         vim.cmd.colorscheme("moonlight")
    --     end,
    -- },
}
