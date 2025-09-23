return {
	"mbbill/undotree",
	event = VeryLazy,
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		{ "<leader>ut", vim.cmd.UndotreeToggle, desc = "Toggle undotree", remap = false },
	},
}
