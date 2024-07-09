-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "G$vgg0", { desc = "Select all" })
keymap.set("n", "<C-a>", "G$vgg0", { desc = "Select all" })

-- Move a line up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move line down in insert mode" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Move to the next function using Alt+Down Arrow
keymap.set("n", "<A-Down>", ":PhpactorGotoDefinitionNext<CR>", { silent = true, desc = "Move to next PHP function" })

-- Move to the previous function using Alt+Up Arrow
keymap.set("n", "<A-Up>", ":PhpactorGotoDefinitionPrev<CR>", { silent = true, desc = "Move to previous PHP function" })
