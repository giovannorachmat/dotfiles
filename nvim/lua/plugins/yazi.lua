return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    config = function()
        require("yazi").setup({
            open_for_directories = false,
            keymaps = { show_help = "<f1>", },
        })
        vim.keymap.set({ "n", "v" }, "<leader>yz", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
        vim.keymap.set({ "n", "v" }, "<leader>Yz", "<cmd>Yazi cwd<cr>",
            { desc = "Open the file manager in nvim's working directory" })
        vim.keymap.set({ "n", "v" }, "<leader>yzt", "<cmd>Yazi toggle<cr>", { desc = "Resume last Yazi session" })
    end
}
