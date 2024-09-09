return {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = function()
        local keymap = vim.keymap

        keymap.set('n', 'H', ':bprev<CR>', { noremap = true, silent = true, desc = "Previous tab" })
        keymap.set('n', 'L', ':bnext<CR>', { noremap = true, silent = true, desc = "Next tab" })
    end
}

