-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Escape mapping
vim.keymap.set("i", "kj", "<esc>")

-- Delete mapping
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
