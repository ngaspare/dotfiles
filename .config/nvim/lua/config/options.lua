-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set the map leader to space
vim.g.mapleader = " "

-- Set the script encoding to UTF-8
-- vim.scriptencoding = "utf-8"

-- Set encoding, fileencoding, and script encoding to UTF-8
-- vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"

-- Show line numbers
-- vim.opt.number = true

-- Show title in the terminal window
vim.opt.title = true

-- Enable auto-indentation
vim.opt.autoindent = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Disable backups
-- vim.opt.backup = false

-- Show incomplete commands
vim.opt.showcmd = true

-- Set command-line height to 0 (no extra height)
-- vim.opt.cmdheight = 0

-- Hide status line unless there are multiple windows
-- vim.opt.laststatus = 0

-- Expand tabs to spaces
-- vim.opt.expandtab = true

-- Set minimum number of lines to keep above/below cursor
vim.opt.scrolloff = 10

-- Automatically preview substitution
vim.opt.inccommand = "split"

-- Ignore case in search
vim.opt.ignorecase = true

-- Use smart tabs
vim.opt.smarttab = true

-- Set breakindent
vim.opt.breakindent = true

-- Set the width of indentation
-- vim.opt.shiftwidth = 2

-- Set tab width
-- vim.opt.tabstop = 4

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Disable line wrapping
-- vim.opt.wrap = false

-- Allow backspacing over everything in insert mode
-- vim.opt.backspace = { "start", "eol", "indent" }

-- Append '**' to 'path'
-- vim.opt.path:append({ "**" })

-- Ignore node_modules in file search
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Split windows below the current window
-- vim.opt.splitbelow = true

-- Split windows to the right of the current window
-- vim.opt.splitright = true

-- Keep the cursor in the same position when splitting windows
vim.opt.splitkeep = "cursor"

-- Add asterisks in block comments automatically
vim.opt.formatoptions:append({ "r" })
