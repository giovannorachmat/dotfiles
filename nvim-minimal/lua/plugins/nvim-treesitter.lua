return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        
        configs.setup({
            ensure_installed = {
                "dockerfile",
                "jq",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "vimdoc",
            },
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },

        })
    end
}
