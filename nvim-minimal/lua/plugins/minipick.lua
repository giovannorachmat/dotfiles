return {
	"echasnovski/mini.pick",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
	end,
}
