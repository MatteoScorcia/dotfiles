-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set basic indentation to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Disable relative numbers
vim.wo.relativenumber = false

-- Disable animations
vim.g.snacks_animate = false

-- LSP Server to use for Python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
