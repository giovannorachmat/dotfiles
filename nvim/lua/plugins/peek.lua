return {
	"toppair/peek.nvim",
	event = "VeryLazy",
	build = "deno task --quiet build:fast",
	keys = {
		{ "<leader>po", "<cmd>PeekOpen<cr>", desc = "Open markdown preview", remap = false },
		{ "<leader>pc", "<cmd>PeekClose<cr>", desc = "Close markdown preview", remap = false },
	},
	config = function()
		require("peek").setup({
			app = "browser", -- This was outside the setup() function
		})
	end,
}
