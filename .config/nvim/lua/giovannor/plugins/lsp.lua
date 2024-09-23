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
		{ "folke/which-key.nvim" }, -- Add which-key as a dependency
	},

	config = function()
		local lsp_zero = require("lsp-zero")
		local wk = require("which-key")

		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

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
				},
				["<F2>"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
				["<F3>"] = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format code" },
				["<F4>"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
			}, opts)
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Autocompletion
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp.mapping.preset.insert({
				-- Confirm completion
				["<C-space>"] = cmp.mapping.complete(),
				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- Navigate between completion items
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})
	end,
}
