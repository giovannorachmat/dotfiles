return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                docker = { "dockerfile-language-server, docker-compose-language-server" },
                hcl = { "hcl" },
                json = { "prettierd", "jq", stop_after_first = true },
                lua = { "stylua" },
                markdown = { "markdownlint-cli2" },
                python = {
                    -- To fix auto-fixable lint errors.
                    "ruff_fix",
                    -- To run the Ruff formatter.
                    "ruff_format",
                    -- To organize the imports.
                    "ruff_organize_imports",
                },
                shell = { "shfmt" },
                sql = { "sqlfmt" },
                terraform = { "terraform_fmt" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
