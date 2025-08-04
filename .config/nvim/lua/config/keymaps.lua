-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Taken from the LazyVim doc
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")

-- vim.keymap.del("i", "<right>")
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")

-- vim.keymap.set("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>")
-- vim.keymap.set("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>")
-- vim.keymap.set("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>")
-- vim.keymap.set("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>")

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>bs", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
map("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })
map("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Neogit current directory" })
map("n", "<leader>gf", "<cmd>Neogit cwd=%:p:h kind='floating'<cr>", { desc = "Neogit cwd floating" })
map("n", "<leader>gs", "<cmd>Neogit cwd=%:p:h kind='split'<cr>", { desc = "Neogit cwd split" })
