vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.keymap.set("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.g.background = "light"
vim.opt.showmode = false

vim.opt.smartcase = true
vim.opt.swapfile = false

vim.o.timeout = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
	"i-ci:ver25-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
	"r:hor50-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
}
vim.opt.signcolumn = "auto:4"

vim.opt.mouse = "a"
vim.cmd("set mousemoveevent")

vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.ignorecase = true
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
