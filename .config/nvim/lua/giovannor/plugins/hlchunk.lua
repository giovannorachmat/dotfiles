return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "┌",
                    left_bottom = "└",
                    right_arrow = "─",
                },
                delay = 0
            },
            indent = {
                enable = true,
                priority = 5,
                chars = {
                    "┊",
                },
                delay = 0,
            },
        })
    end
}
