-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Remaps taken from theprimeagen's remap.lua
-- https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/lua/theprimeagen/remap.lua

-- move objects while highlighting
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- set cursor to stay in place when adding below line
keymap.set("n", "J", "mzJ`z")

-- set cursor to stay in the middle when jumping up (ctrl + u) and down (ctrl + d)
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- set cursor to stay in the middle when searching using f
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- keeps last copied object in the register
keymap.set("x", "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland
-- yanked using system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Close buffer with <leader>bd
keymap.set('n', '<leader>bd', ':bprevious<bar>bd #<CR>',
    { noremap = true, silent = true, desc = "Delete current buffer" })
