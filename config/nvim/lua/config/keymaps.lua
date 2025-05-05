-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- Move cursor left and right in Insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left in Insert mode" })
map("i", "<C-l>", "<Right>", { desc = "Move right in Insert mode" })
