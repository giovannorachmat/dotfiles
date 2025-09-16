return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                float = {
                    transparent = true,
                    solid = false,  -- use solid styling for floating windows, see |winborder|
                },
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                auto_integrations = true,
                integrations = {
                    nvim_surround = true,
                    native_lsp    = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                }
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
