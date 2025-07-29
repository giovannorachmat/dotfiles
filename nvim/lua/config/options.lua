-- Credits to Josean
-- https://www.josean.com/posts/how-to-setup-neovim-2024

vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt -- for conciseness

-- set fat cursor
opt.guicursor = ""

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.softtabstop = 2 -- 2 spaces for soft tab stops
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Visual settings
opt.colorcolumn = "100" -- Show column at 100 characters
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket
opt.cmdheight = 1 -- Command line height
opt.completeopt = "menuone,noinsert,noselect" -- Completion options
opt.showmode = false -- Don't show mode in command line
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Floating window transparency
opt.conceallevel = 0 -- Don't hide markup
opt.concealcursor = "" -- Don't hide cursor line markup
-- opt.lazyredraw = true -- Don't redraw during macros
opt.synmaxcol = 300 -- Syntax highlighting limit

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- undotree related
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 10000

-- left 12 lines above and below when scrolling
opt.scrolloff = 12

-- set fold behavior
opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- Start with all folds open

vim.bo.commentstring = "-- %s"

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.autochdir = false -- Don't auto change directory
opt.iskeyword:append("-") -- Treat dash as part of word
opt.path:append("**") -- include subdirectories in search
opt.selection = "exclusive" -- Selection behavior
opt.mouse = "a" -- Enable mouse support
