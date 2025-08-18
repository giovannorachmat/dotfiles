return {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
        require("conform").setup({
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
                terraform = { "terraform_fmt" },
            },

            default_format_opts = {
                timeout_ms = 2500,
                lsp_format = "fallback",
                dry_run = true,
                quiet = false,
            },
            -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#autoformat-with-extra-features
            format_on_save = function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = { "sql" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- -- Disable with a global or buffer-local variable
                -- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                --     return
                -- end
                -- -- Disable autoformat for files in a certain path
                -- local bufname = vim.api.nvim_buf_get_name(bufnr)
                -- if bufname:match("/node_modules/") then
                --     return
                -- end
                -- -- ...additional logic...
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        })
    end,
}
