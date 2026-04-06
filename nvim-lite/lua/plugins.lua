
-- ============================================================================
-- PACKAGES
-- ============================================================================

vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	
	-- { src = "https://github.com/nvim-telescope/telescope.nvim" },
	-- { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	-- { src = "https://github.com/nvim-tree/nvim-web-devicons" },
	-- { src = "https://github.com/stevearc/oil.nvim" },
	-- { src = "https://github.com/catppuccin/nvim" },
	-- { src = "https://github.com/echasnovski/mini.pick" },
})

-- telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["<esc>"] = actions.close,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
			},
		},
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })

local actions = require("telescope.actions")


-- lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazygit" })

-- undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })


-- require "catppuccin".setup({
--   flavour = "mocha",                           -- latte, frappe, macchiato, mocha
--   transparent_background = true,               -- disables setting the background color.
--   float = {
--     transparent = true,
--     solid = false,                          -- use solid styling for floating windows, see |winborder|
--   },
--   term_colors = true,                       -- sets terminal colors (e.g. `g:terminal_color_0`)
--   auto_integrations = false,
-- })

-- vim.cmd.colorscheme("catppuccin")