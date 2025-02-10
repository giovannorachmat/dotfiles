return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		local oil = require("oil")

		oil.setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			use_default_keymaps = true,
		})
	end,
}
