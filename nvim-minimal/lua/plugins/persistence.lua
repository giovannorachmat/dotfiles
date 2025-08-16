return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
        vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
    end
}
