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

vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

vim.keymap.set("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>")

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>bs", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
map("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })
map("n", "<leader>qs", "<cmd>SessionManager load_session<cr>", { desc = "Load a Session" })
map("n", "<leader>qf", "<cmd>SessionManager load_current_dir_session<cr>", { desc = "Load current directory session" })
map("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Negit current directory" })
map("n", "<leader>gf", "<cmd>Neogit cwd=%:p:h kind='floating'<cr>", { desc = "Negit cwd floating" })
map("n", "<leader>gs", "<cmd>Neogit cwd=%:p:h kind='split'<cr>", { desc = "Negit cwd split" })
-- ToggleTerm
-- if Util.has("toggleterm.nvim") then
-- local toggle_term_cmd = helpers.toggle_term_cmd

-- if vim.fn.executable("lazygit") == 1 then
--   map("n", "<leader>gg", function()
--     toggle_term_cmd("lazygit")
--   end, { desc = "ToggleTerm lazygit" })
--   map("n", "<leader>gg", function()
--     toggle_term_cmd("lazygit")
--   end, { desc = "ToggleTerm lazygit" })
-- end
-- if vim.fn.executable("node") == 1 then
--   map("n", "<leader>tn", function()
--     toggle_term_cmd("node")
--   end, { desc = "ToggleTerm node" })
-- end
-- if vim.fn.executable("gdu") == 1 then
--   map("n", "<leader>tu", function()
--     toggle_term_cmd("gdu")
--   end, { desc = "ToggleTerm gdu" })
-- end
-- if vim.fn.executable("btm") == 1 then
--   map("n", "<leader>tt", function()
--     config = function()
--       require("nvim-surround").setup({
--         -- Configuration here, or leave empty to use defaults
--       })
--     end
--     toggle_term_cmd("btm")
--   end, { desc = "ToggleTerm btm" })
-- end
-- local python = vim.fn.executable("python") == 1 and "python" or vim.fn.executable("python3") == 1 and "python3"
-- if python then
--   map("n", "<leader>tp", function()
--     toggle_term_cmd(python)
--   end, { desc = "ToggleTerm python" })
-- end
-- map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
-- map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
-- map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
-- map({ "n", "t" }, { "<F7>", "<C-'>" }, "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
-- end
-- Improved Terminal navigation
-- map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
-- map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
-- map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
-- map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window navigation" })

-- LSPSaga
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     vim.keymap.del("n", "K", { buffer = args.buf })
--     vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { buffer = args.buf })
--   end,
-- })
-- map("n", "<leader>aa", "<cmd>Lspsaga code_action<cr>", { desc = "code actions" })
-- map("n", "<leader>ar", "<cmd>Lspsaga rename<cr>", { desc = "Rename" })
-- map("n", "<leader>af", "<cmd>Lspsaga lsp_finder<cr>", { desc = "LSP finder" })
-- map("n", "<leader>al", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "LSP finder" })
-- map("n", "<leader>al", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostics" })
-- map("n", "<leader>ab", "<cmd>Lspsaga show_buf_diagnostics<cr>", { desc = "Show buffer diagnostics" })
-- map("n", "<leader>ac", "<cmd>Lspsaga show_cursor_diagnostics<cr>", { desc = "Show cursor diagnostics" })
-- map("n", "<leader>ap", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
-- map("n", "<leader>at", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "Peek type definition" })
-- map("n", "<leader>ah", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" })
-- map("n", "<leader>ao", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
