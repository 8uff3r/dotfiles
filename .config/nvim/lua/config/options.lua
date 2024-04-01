-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local options = {
  softtabstop = 4,
  swapfile = false,
  backup = false,
  hlsearch = false,
  incsearch = true,
  termbidi = true,
  guifont = "FiraCode Nerd Font:h14:480",
  -- colorcolumn = "80",
  clipboard = "unnamedplus", -- Connection to the system clipboard
  cmdheight = 0, -- hide command line unless needed
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  copyindent = true, -- Copy the previous indentation on autoindenting
  cursorline = true, -- Highlight the text line of the cursor
  expandtab = true, -- Enable the use of space in tab
  fileencoding = "utf-8", -- File content encoding for the buffer
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  foldenable = true, -- enable fold for nvim-ufo
  foldlevel = 99, -- set high foldlevel for nvim-ufo
  foldlevelstart = 99, -- start with all code unfolded
  foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
  history = 100, -- Number of commands to remember in a history table
  ignorecase = true, -- Case insensitive searching
  laststatus = 3, -- globalstatus
  mouse = "a", -- Enable mouse support
  number = true, -- Show numberline
  preserveindent = true, -- Preserve indent structure as much as possible
  pumheight = 10, -- Height of the pop up menu
  relativenumber = true, -- Show relative numberline
  scrolloff = 8, -- Number of lines to keep above and below the cursor
  shiftwidth = 2, -- Number of space inserted for indentation
  showmode = false, -- Disable showing modes in command line
  showtabline = 2, -- always display tabline
  sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes", -- Always show the sign column
  smartcase = true, -- Case sensitivie searching
  splitbelow = true, -- Splitting a new window below the current one
  -- TODO v3 REMOVE THIS CONDITIONAL
  splitkeep = vim.fn.has("nvim-0.9") == 1 and "screen" or nil, -- Maintain code view when splitting
  splitright = true, -- Splitting a new window at the right of the current one
  tabstop = 2, -- Number of space in a tab
  termguicolors = true, -- Enable 24-bit RGB color in the TUI
  timeoutlen = 500, -- Shorten key timeout length a little bit for which-key
  undofile = true, -- Enable persistent undo
  updatetime = 300, -- Length of time to wait before triggering the plugin
  wrap = true, -- enable wrapping of lines longer than the width of window
  writebackup = false,
}

local globals = {
  maplocalleader = " ",
  highlighturl_enabled = true, -- highlight URLs by default
  mapleader = " ", -- set leader key
  autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
  autoformat = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
  -- codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
  lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
  cmp_enabled = true, -- enable completion at start
  autopairs_enabled = true, -- enable autopairs at start
  diagnostics_enabled = true, -- enable diagnostics at start
  status_diagnostics_enabled = true, -- enable diagnostics in statusline
  icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
  ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  -- Prettier

  ["prettier#autoformat"] = 1,
  ["prettier#autoformat_require_pragma"] = 0,
  ["prettier#exec_cmd_async"] = 1,
}
vim.lsp.buf.format({ timeout_ms = 30000 })
vim.g.acd = true
for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- Highlight Groups
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#626A95" })

vim.cmd([[
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-s-v> "+p
nmap <c-s-v> "+p
inoremap <c-s-v> <c-r>+
cnoremap <c-s-v> <c-r>+
]])
