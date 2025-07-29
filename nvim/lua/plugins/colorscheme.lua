return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			styles = {
	-- 				transparency = true,
	-- 			},
	-- 			highlight_groups = {
	-- 				Visual = { bg = "love", blend = 60 },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("rose-pine")
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
		priority = 1000,
		config = function()
			require("eldritch").setup({
				transparent = true,
				pallete = "darker",
				styles = {
					sidebars = "terminal",
					floats = "transparent",
					background = "darker",
				},
				terminal_colors = true,
				on_highlights = function(hl, colors)
					-- hl.LineNrAbove = {
					-- 	fg = colors.comment,
					-- }
					-- hl.LineNrBelow = {
					-- 	fg = colors.comment,
					-- }
					-- hl.Comment = {
					-- 	fg = "#323449",
					-- }
					-- hl.Visual = {
					-- 	bg = colors.green,
					-- }
					hl.VisualNOS = {
						bg = colors.green,
					}
				end,
			})
			--
			-- Ensure the colorscheme is applied
			vim.cmd.colorscheme("eldritch")
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
	--
	-- {
	-- 	"vague2k/vague.nvim",
	-- 	lazy = false,
	-- 	priority = 10000,
	-- 	config = function()
	-- 		require("vague").setup({
	-- 			transparent = true,
	-- 		})
	-- 	end,
	-- },
}
