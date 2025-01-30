-- Leader key options
vim.keymap.set("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Escape mapping
vim.keymap.set("i", "kj", "<esc>")

-- Write mapping
vim.keymap.set("n", "<c-s>", "<cmd>:w<CR>", { noremap = true, silent = true })

-- Delete mapping
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Tab options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- System options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true

-- Timeout options
vim.o.timeout = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.inccommand = "split"

-- GUI options
vim.wo.number = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.title = false
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.termguicolors = true
vim.opt.guifont = "*"
vim.opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
	"i-ci:ver25-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
	"r:hor50-Cursor/lCursor-blinkwait0-blinkon50-blinkoff50",
}

-- LSP Undercurl (Terminal specific option)
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- mouse options
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.mousemoveevent = true -- allow mouse move event

-- Better window navigation
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>", { noremap = true, silent = true })

-- Better window splits
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.keymap.set("n", "ss", "<cmd>split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", "<cmd>vsplit<CR>", { noremap = true, silent = true })

-- Search options
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
vim.opt.ignorecase = true

-- Highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
