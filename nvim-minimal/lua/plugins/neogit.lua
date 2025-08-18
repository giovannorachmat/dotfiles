return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.keymap.set("n", "<leader>ng", ":Neogit<CR>", { desc = "Neogit" })
    end
}
