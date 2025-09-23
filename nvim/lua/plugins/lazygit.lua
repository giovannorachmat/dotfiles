return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    keys = {
        { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    config = function()
        vim.g.lazygit_floating_window_winblend = 0
        vim.g.lazygit_floating_window_scaling_factor = 0.9
        vim.g.lazygit_use_neovim_remote = 1 -- If you want to use nvim-remote for opening files
    end,
}
