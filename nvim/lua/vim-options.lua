vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.opt.clipboard = 'unnamedplus'
vim.g.background = 'light'
vim.opt.showmode = false

vim.opt.smartcase = true
vim.opt.swapfile = false

vim.opt.updatetime = 250
vim.o.timeout = true
vim.opt.timeoutlen = 300
vim.opt.inccommand = 'split'

vim.opt.mouse = 'a'
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<CR>')

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.ignorecase = true
