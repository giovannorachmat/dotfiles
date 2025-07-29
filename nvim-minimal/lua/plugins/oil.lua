return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local oil = require("oil")
        oil.setup()
        oil.toggle_hidden()

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
