-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- emulate autochdir, which is deprecated, source: https://www.reddit.com/r/neovim/comments/10jmoqw/comment/j5uaud5
vim.api.nvim_create_augroup("autochdir", {})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "autochdir",
  pattern = "?*",
  callback = function()
    local ignoredFT = {
      "gitcommit",
      "NeogitCommitMessage",
      "DiffviewFileHistory",
      "",
    }
    if
      not vim.bo.modifiable
      or vim.tbl_contains(ignoredFT, vim.bo.filetype)
      or not (vim.fn.expand("%:p"):find("^/"))
    then
      return
    end
    vim.cmd.cd(vim.fn.expand("%:p:h"))
  end,
})
vim.api.nvim_create_autocmd("DirChanged", {
  group = vim.api.nvim_create_augroup("setDir", { clear = true }),
  pattern = { "*" },
  command = [[call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd))]],
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lisp",
  callback = function(args)
    local res = vim.fn.jobstart("sbcl --eval '(ql:quickload \"alive-lsp\")' --eval '(alive/server::start :port 8006)'")
    os.execute("sleep 6")
    vim.lsp.start({ name = "alive-lsp", cmd = vim.lsp.rpc.connect("127.0.0.1", 8006) })
  end,
})
