return {
    "nvim-mini/mini.files",
    version = "*",
    config = function()
        require("mini.files").setup({
            options = {
                permanent_delete = false
            },
            windows = {
                preview = true,
                width_preview = 100,
                width_focus = 15,
            },
        })

        vim.keymap.set("n", "<leader>ef", function() MiniFiles.open() end, { desc = "mini.files" })
    end,
}
