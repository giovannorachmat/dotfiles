return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "master",
            lazy = false,
            build = ":TSUpdate"
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = vim.fn.executable("make") == 1
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                    n = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files cwd=false<cr>", { desc = "Find Files (cwd)" })
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep (Root Dir })" })
        vim.keymap.set("n", "<leader>fG", "<cmd>Telescope live_grep cwd=false<cr>", { desc = "Grep (cwd)" })
        vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })
        vim.keymap.set("n", "<leader>fR", "<cmd>Telescope oldfiles cwd_only=true<cr>", { desc = "Recent (cwd )" })
        vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
        vim.keymap.set("n", "<leader>fC", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
        vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
        vim.keymap.set("n", "<leader>fH", "<cmd>Telescope highlights<cr>", { desc = "Search Highlight Groups" })
        vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
        vim.keymap.set("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
        vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Jump to Mark" })
        vim.keymap.set("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
        vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix List" })
        vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", { desc = "Jumplist" })
        vim.keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Location List" })
        vim.keymap.set("n", "<leader>ft", "<cmd>Telescope colorscheme enable_preview=true<cr>",
            { desc = "Colorscheme with Preview" })
        vim.keymap.set("n", "<leader>fs", "<cmd>Telescope treesitter<cr>", { desc = "Goto Symbol" })
        vim.keymap.set("n", "<leader>fS", "<cmd>Telescope lsp_document_symbols<cr>",
            { desc = "Goto Symbol (Workspace )" })
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" })
        vim.keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" })
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto Definition" })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
        vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto Implementation" })
        vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Goto T[y]pe Definition" })
    end,
}
