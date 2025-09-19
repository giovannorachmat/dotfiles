return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    ---@type snacks.Config
    opts = {
        util = { enabled = true },
        win = { enabled = true },
        bufdelete = { enabled = true },
        lazygit = {
            enabled = true,
            configure = true,
        },
    },
    keys = {
        { "<leader>lg", function() Snacks.lazygit() end,   desc = "Open Lazygit (snacks)" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer (snacks)" },
    }

}
