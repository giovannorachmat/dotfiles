return {
  "echasnovski/mini.pick",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("mini.pick").setup()

    vim.keymap.set('n', '<leader>ff', ':Pick files<CR>', { desc = 'Pick files' })
    vim.keymap.set('n', '<leader>fh', ':Pick help<CR>', { desc = 'Pick help' })
    vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>', { desc = 'Pick buffers' })
  end
}
