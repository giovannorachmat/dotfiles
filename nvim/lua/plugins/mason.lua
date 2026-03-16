return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    { "neovim/nvim-lspconfig", opts = { diagnostics = { virtual_text = false } } },
  },

  ensure_installed = {
    "bashls",
    "docker_compose_language_service",
    "docker_language_server",
    "dockerls",
    "gitlab_ci_ls",
    "lua_ls",
    "pyproject-fmt",
    "pyright",
    "ruff",
    "shfmt",
    "snyk_ls",
    "sqruff",
    "stylua",
    "trivy",
    "yamlfmt",
    "yamlls",
    "yq",
  },
}
