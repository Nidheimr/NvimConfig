-- options

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.nu = true
vim.o.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 4
vim.o.signcolumn = "yes"

vim.cmd("set whichwrap+=<,>,[,]")
vim.cmd("set clipboard=unnamedplus")
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
