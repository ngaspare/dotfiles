-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Map the 'x' key in normal mode to delete the character under the cursor without affecting the default register.
keymap.set("n", "x", '"_x')

-- Map the 'dd' key sequence in normal mode to delete the current line and store it in the default register.
keymap.set("n", "dd", '"_dd')
