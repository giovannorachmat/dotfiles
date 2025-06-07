return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "(Telescope) Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "(Telescope) Live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "(Telescope) Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "(Telescope) Help tags" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "(Telescope) Quickfix list" })
		vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "(Telescope) Jump list" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "(Telescope) Marks" })
		vim.keymap.set("n", "<leader>fs", builtin.treesitter, { desc = "(Telescope) Treesitter" })
	end,
}
