-- ============================================================================
-- LSP & completions
-- ============================================================================

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.lsp.enable({
	"bashls",
	"bqls",
	"docker_compose_language_service",
	"docker_language_server",
	"dockerls",
	"harper_ls",
	"lua_ls",
	"ruff",
	"snyk_ls",
	"sqruff",
	"stylua",
	"yamlls",
})
