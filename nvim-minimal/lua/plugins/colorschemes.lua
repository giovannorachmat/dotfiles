return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
      })

      vim.cmd.colorscheme("rose-pine")
    end
  },
  -- {
  --   "vague2k/vague.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "vague",
  --   config = function()
  --     require("vague").setup({
  --       transparent = true,
  --     })
  --
  --     vim.cmd.colorscheme("vague")
  --   end,
  -- },
}
