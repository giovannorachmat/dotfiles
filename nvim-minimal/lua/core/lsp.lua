-- ============================================================================
-- LSP
-- ============================================================================

vim.lsp.enable({
	"bqls",
	"docker_compose_language_service",
	"dockerls",
  "harper_ls",
  "lua_ls",
	"ruff",
  "pyright",
	"snyk_ls",
	"yamlls",
})

vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = false,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
