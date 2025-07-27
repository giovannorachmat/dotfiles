return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
					n = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
			},
		})

		local wk = require("which-key")
		wk.add({
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fF", "<cmd>Telescope find_files cwd=false<cr>", desc = "Find Files (cwd)" },
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
			{ "<leader>fG", "<cmd>Telescope live_grep cwd=false<cr>", desc = "Grep (cwd)" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{ "<leader>fR", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Recent (cwd)" },
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>fC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
			{ "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
			{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
			{ "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
			{ "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
			{ "<leader>ft", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme with Preview" },
			{ "<leader>fs", "<cmd>Telescope treesitter<cr>", desc = "Goto Symbol" },
			{ "<leader>fS", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Goto Symbol (Workspace)" },
			-- Git
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			-- LSP
			{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
			{ "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
			{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
			{ "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },
		})
	end,
}
