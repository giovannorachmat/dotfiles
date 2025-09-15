return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                -- transparent_background = true, -- disables setting the background color.
                float = {
                    transparent = true,
                    solid = false,          -- use solid styling for floating windows, see |winborder|
                },
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = true,         -- sets terminal colors (e.g. `g:terminal_color_0`)
                auto_integrations = true,
            })

            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
        end
    }
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,
    --     lazy = false,
    --     config = function()
    --         require("rose-pine").setup({
    --             transparent = true
    --         })
    --
    --         vim.cmd.colorscheme("rose-pine")
    --     end
    -- },
    -- {
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
    -- },
}
