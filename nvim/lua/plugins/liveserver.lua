return {
  "https://forge.barrettruth.com/barrettruth/live-server.nvim",
  init = function()
    vim.g.live_server = {
      port = 5500,
    }
  end,
}
