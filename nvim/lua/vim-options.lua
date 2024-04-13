vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.keymap.set("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
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
-- LSP Undercurl (Terminal specific option)
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.mousemoveevent = true -- allow mouse move event

-- Better window navigation
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

-- Better window splits
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.keymap.set("n", "ss", "<cmd>split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", "<cmd>vsplit<CR>", { noremap = true, silent = true })

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.ignorecase = true
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
