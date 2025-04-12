return {
	"snacks.nvim",
	opts = {
		scroll = { enabled = false },
		explorer = { enabled = false },
		indent = { scope = { enabled = false } },
	},
	keys = {
		{ "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = false },
		{ "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = false },
	},
}
