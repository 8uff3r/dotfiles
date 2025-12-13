-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>bs", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
map("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })
map("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Neogit current directory" })
map("n", "<leader>gf", "<cmd>Neogit cwd=%:p:h kind='floating'<cr>", { desc = "Neogit cwd floating" })
map("n", "<leader>gs", "<cmd>Neogit cwd=%:p:h kind='split'<cr>", { desc = "Neogit cwd split" })
