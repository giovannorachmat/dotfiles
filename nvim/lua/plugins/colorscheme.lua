return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	lazy = false,
	-- 	version = false,
	-- 	name = "everforest",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local everforest = require("everforest")
	--
	-- 		everforest.setup({
	-- 			background = "hard",
	-- 			italics = true,
	-- 			diagnostic_text_highlight = true,
	-- 			show_eob = false,
	-- 			-- on_highlights = function(hl, _)
	-- 			-- 	hl["@string.special.symbol.ruby"] = { link = "@field" }
	-- 			-- end,
	-- 		})
	--
	-- 		-- everforest.load()
	--
	-- 		vim.cmd.colorscheme("everforest")
	-- 	end,
	-- },
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		config = function()
			require("eldritch").setup({
				transparent = true,
				terminal_colors = true,
			})
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	version = false,
	-- 	priority = 1000,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		local catppuccin = require("catppuccin")
	--
	-- 		catppuccin.setup({
	-- 			integrations = {
	-- 				nvimtree = true,
	-- 			},
	-- 			-- custom_highlights = {
	-- 			-- 	LineNr = { fg = "#a6adc8" },
	-- 			-- },
	-- 			transparent_background = false,
	-- 		})
	--
	-- 		vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },
}
