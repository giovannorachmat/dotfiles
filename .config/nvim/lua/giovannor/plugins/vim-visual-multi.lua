return {
	"mg979/vim-visual-multi",
	branch = "master",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.VM_maps = {
			["Add Cursor Up"] = "<C-S-Up>",
			["Add Cursor Down"] = "<C-S-Down>",
		}
	end,
}
