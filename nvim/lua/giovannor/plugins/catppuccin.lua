return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			integrations = {
				nvimtree = true,
			},
			custom_highlights = {
				LineNr = { fg = "#a6adc8" },
			},
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
