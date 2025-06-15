return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = true,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		local wk = require("which-key")
		--
		wk.add({
			{ mode = "n", "<leader>e", desc = "nvim-tree", icon = " " },
			{ mode = "n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
			{
				mode = "n",
				"<leader>ef",
				"<cmd>NvimTreeFindFileToggle<CR>",
				desc = "Toggle file explorer on current file",
			},
			{ mode = "n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
		})
	end,
}
