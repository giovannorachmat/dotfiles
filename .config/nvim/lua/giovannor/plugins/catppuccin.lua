return {
	"catppuccin/nvim",
	lazy = false,
	name = catppuccin,
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			integrations = {
				nvimtree = true,
			},
			custom_highlights = {
				LineNr = { fg = "#a6adc8" },
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
