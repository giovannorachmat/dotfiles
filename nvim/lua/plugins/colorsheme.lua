return {
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		name = "eldritch",
		config = function()
			require("eldritch").setup({
				transparent = true,
				terminal_colors = true,
			})

			vim.cmd.colorscheme("eldritch")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		local catppuccin = require("catppuccin")
	--
	-- 		catppuccin.setup({
	-- 			integrations = {
	-- 				nvimtree = true,
	-- 			},
	-- 			custom_highlights = {
	-- 				LineNr = { fg = "#a6adc8" },
	-- 			},
	-- 			transparent_background = true,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- }
}
