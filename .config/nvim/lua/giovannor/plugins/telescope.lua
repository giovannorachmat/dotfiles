return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep",
    "tiagovla/scope.nvim",
    "ANGkeith/telescope-terraform-doc.nvim",
    "cappyzawa/telescope-terraform.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("scope")
    telescope.load_extension("terraform_doc")
    telescope.load_extension("terraform")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files in current working directory" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep hidden=true<cr>", { desc = "Find string in current working directory" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string hidden=true<cr>", { desc = "Find string under cursor in current working directory" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find string in recent files" })
    keymap.set("n", "<leader>bf", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer" })
    keymap.set("n", "<leader>bk", "<cmd>Telescope keymaps<cr>", { desc = "Check keymaps" })
  end,
}
