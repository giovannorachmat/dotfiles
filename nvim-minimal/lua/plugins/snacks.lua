return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	---@type snacks.Config
	opts = {
		explorer = { enabled = true },
		bufdelete = { enabled = true },
		lazygit = {
			enabled = true,
			configure = true,
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open Lazygit (snacks)",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete buffer (snacks)",
		},
		{
			"-",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer (snacks)",
		},
	},
}
