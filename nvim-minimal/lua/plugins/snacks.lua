return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    ---@type snacks.Config
    opts = {
        dim = { enabled = true },
        util = { enabled = true },
        win = { enabled = true },
        bufdelete = { enabled = true },
        lazygit = { enabled = true },
    },
    keys = {
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" }, }
}
