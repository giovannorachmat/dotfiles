return {
    'MagicDuck/grug-far.nvim',
    lazy = false,
    opts = { headerMaxWidth = 80 },
    config = function()
        local grug = require("grug-far")
        grug.setup()

        vim.keymap.set(
            { "n", "v" }, "<leader>sr",
            function()
                local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
                grug.open({
                    transient = true,
                    prefills = {
                        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                    },
                })
            end,
            { desc = 'grug-far: Search & replace' }
        )

        vim.keymap.set(
            { 'n', 'x' }, '<leader>si',
            function()
                grug.open({
                    visualSelectionUsage = 'operate-within-range'
                })
            end,
            { desc = 'grug-far: Search within range' }
        )
    end
}
