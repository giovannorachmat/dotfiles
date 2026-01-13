return {
  {
    "folke/snacks.nvim",
    opts = {
      -- https://github.com/LazyVim/LazyVim/discussions/5730#discussioncomment-15389203
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true, -- show dotfiles in fuzzy finder
            ignored = true, -- optional: show gitignored files
          },
        },
      },
    },
  },
}
