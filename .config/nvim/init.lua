-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("config.autocmds")
require("utils")
-- Set to false to disable.
vim.g.lazygit_config = false
vim.cmd([[
set mousemodel=extend
set noarabicshape
]])

vim.o.guifont = "FiraCode Nerd Font:h15"
-- vim.g.guifont = "FiraCode Nerd Font:h14"
if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")
--
-- if not configs.gambit_scheme_lsp then
--   configs.gambit_scheme_lsp = {
--     default_config = {
--       filetypes = { "scheme" },
--       cmd = {
--         "/home/rylan/.gambit_userlib/codeberg.org/rgherdt/scheme-lsp-server/@/gambit/gambit-lsp-server",
--       },
--       name = "gambit-lsp-server",
--       root_dir = require("lspconfig").util.root_pattern(".git", ".gitignore", "gerbil.pkg"),
--       init_options = {},
--     },
--   }
-- end
-- lspconfig.gambit_scheme_lsp.setup({})
vim.filetype.add({
  extension = {
    re = "reason",
    atd = "atd",
  },
})
local list = require("nvim-treesitter.parsers").get_parser_configs()
list.reason = {
  install_info = {
    url = "https://github.com/reasonml-editor/tree-sitter-reason",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "master",
  },
}
list.atd = list.ocaml
vim.treesitter.language.add("reason", { filetype = "reason" })
vim.treesitter.language.add("ocaml", { filetype = "atd" })
local lspconfig = require("lspconfig")

lspconfig.teal_ls.setup({})

require("zenity_edit")
