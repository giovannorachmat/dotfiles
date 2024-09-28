return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	lazy = false,
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "neovim/nvim-lspconfig" },
		{ "folke/which-key.nvim" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local wk = require("which-key")

		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			-- Normal mode mappings
			wk.register({
				K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover information" },
				g = {
					name = "Go to",
					d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
					D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
					i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
					o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
					r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
					s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
					X = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
					A = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
				},
			}, opts)
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			on_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Autocompletion
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				lsp_zero.default_setup,
			},
		})
	end,
}
