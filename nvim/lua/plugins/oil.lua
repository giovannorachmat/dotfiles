return {
    "stevearc/oil.nvim",
    lazy = true,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local oil = require("oil")
        oil.setup({
            default_file_explorer = false,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            win_options = {
                wrap = true,
            },
            cleanup_delay_ms = 500,
        })

        vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
