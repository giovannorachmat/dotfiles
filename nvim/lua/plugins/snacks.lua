return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        explorer  = { enabled = true },
        bufdelete = { enabled = true },
        terminal  = { enabled = true },
        dim       = { enabled = true },
    },
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer (snacks)", },
        { "-",          function() Snacks.explorer() end,  desc = "Explorer (snacks)", }, },
}
