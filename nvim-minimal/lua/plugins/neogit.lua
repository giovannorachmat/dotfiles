return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
  },
    config = function()
        vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Neogit" })
    end
}
