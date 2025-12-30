-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set

-- Tab für Buffer Navigation (wie NvChad)
-- map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
