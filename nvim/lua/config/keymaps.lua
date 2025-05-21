-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function add_desc(desc)
  return vim.tbl_extend("force", opts, { desc = desc })
end

-- Increment/Decrement numbers
keymap.set("n", "=", "<C-a>", add_desc("Increment number"))
keymap.set("n", "-", "<C-x>", add_desc("Decrement number"))
