return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = function()
        vim.keymap.set("n", "<leader>ng", ":Neogit<CR>", { desc = "Neogit" })
        vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
        vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diffview Close" })
    end
}
