-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.cmd("let g:netrw_liststyle = 3")

vim.g.snacks_animate = false
vim.g.trouble_lualine = true

local opt = vim.opt -- for conciseness

opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- undotree related
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- left 12 lines above and below when scrolling
opt.scrolloff = 12
opt.smoothscroll = false

opt.signcolumn = "yes"
-- set a column border
opt.colorcolumn = "100"

vim.bo.commentstring = "-- %s"
