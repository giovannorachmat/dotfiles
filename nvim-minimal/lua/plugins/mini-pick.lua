return {
    "echasnovski/mini.pick",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("mini.pick").setup({
            mappings = {
                move_down = "<C-j>",
                move_up = "<C-k>",
            },
        })

        local builtin = require("mini.pick").builtin
        vim.keymap.set("n", "<leader>pf", function() builtin.files() end, { desc = "Pick files" })
        vim.keymap.set("n", "<leader>ph", function() builtin.help() end, { desc = "Pick help" })
        vim.keymap.set("n", "<leader>pb", function() builtin.buffers() end, { desc = "Pick buffers" })
        vim.keymap.set("n", "<leader>pg", function() builtin.grep_live() end, { desc = "Pick grep" })
    end,
}
