return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true,
				},
				-- highlight_groups = {
				-- 	Visual = { bg = "love", blend = 60 },
				-- },
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
