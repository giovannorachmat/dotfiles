return {
    "nvim-mini/mini.files",
    version = "*",
    config = function()
        require("mini.files").setup()

        vim.keymap.set("n", "<leader>ef", function() MiniFiles.open() end, { desc = "mini.files" })
    end,
}
