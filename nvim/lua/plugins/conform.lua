return {
	"stevearc/conform.nvim",
	lazy = false,
	optional = false,
	event = { "BufReadPre", "BufNewFile", "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = function()
		local opts = {
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
				async = false,
				quiet = false,
			},
		}

		return opts
	end,
}
