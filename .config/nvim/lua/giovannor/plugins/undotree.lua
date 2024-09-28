return {
	"mbbill/undotree",
	lazy = true,
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
	end,
}
