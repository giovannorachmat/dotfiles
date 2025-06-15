return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				-- style = "#bac2de",
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "┌",
					left_bottom = "└",
					right_arrow = "─",
				},
				delay = 1,
			},
			indent = {
				enable = true,
				priority = 5,
				chars = {
					"┊",
				},
				delay = 0,
			},
			line_num = {
				enable = true,
				-- style = "#37f499",
			},
		})
	end,
}
