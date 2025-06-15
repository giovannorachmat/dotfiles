return {
	"folke/snacks.nvim",
	lazy = true,
	opts = {
		scroll = { enabled = false },
		explorer = { enabled = false },
		picker = { enabled = false },
		picker_sources = { enabled = false },
		picker_lsp = { enabled = false },
		indent = { enabled = false },
		dashboard = {
			preset = {
				pick = function(cmd, opts)
					return LazyVim.pick(cmd, opts)()
				end,
				header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua require'telescope.builtin'.find_files{}" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua require'telescope.builtin'.live_grep{}" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua require'telescope.builtin'.oldfiles{}" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
			},
		},
	},
	keys = {
		{ "<leader>n", false },
		{ "<leader>,", false },
		{ "<leader>fb", false },
		{ "<leader>fB", false },
		{ "<leader>fC", false },
		{ "<leader>fe", false },
		{ "<leader>fE", false },
		{ "<leader>fg", false },
		{ "<leader>fp", false },
		{ "<leader>fr", false },
		{ "<leader>fR", false },
		{ "<leader>E", false },
		{ "<leader>e", false },
		{ "<leader>S", false },
		{ "<leader>S", false },
		{ "<leader>/", false },
		{ "<leader>.", false },
		{ "<leader>:", false },
		{ "<leader><leader>", false },
	},
}
