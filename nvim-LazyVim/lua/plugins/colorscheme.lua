return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "everforest",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      --   require("everforest").setup({
      --     -- Your config here
      --   })
      vim.cmd.colorscheme("everforest")
    end,
  },
  -- {
  --   "eldritch-theme/eldritch.nvim",
  --   -- lazy = false,
  --   -- priority = 100,
  --   name = "eldritch",
  --   config = function()
  --     require("eldritch").setup({
  --       transparent = true,
  --       terminal_colors = true,
  --     })
  --
  --     -- vim.cmd.colorscheme("eldritch")
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "everforest",
  --   },
  -- },
}
