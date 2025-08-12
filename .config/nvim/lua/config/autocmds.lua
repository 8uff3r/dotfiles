--
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- emulate autochdir, which is deprecated, source: https://www.reddit.com/r/neovim/comments/10jmoqw/comment/j5uaud5
-- vim.api.nvim_create_augroup("autochdir", {})
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   group = "autochdir",
--   pattern = "?*",
--   callback = function()
--     local ignoredFT = {
--       "gitcommit",
--       "NeogitCommitMessage",
--       "DiffviewFileHistory",
--       "",
--     }
--     if
--       not vim.bo.modifiable
--       or vim.tbl_contains(ignoredFT, vim.bo.filetype)
--       or not (vim.fn.expand("%:p"):find("^/"))
--     then
--       return
--     end
--     vim.cmd.cd(vim.fn.expand("%:p:h"))
--   end,
-- })
-- vim.api.nvim_create_autocmd("DirChanged", {
--   group = vim.api.nvim_create_augroup("setDir", { clear = true }),
--   pattern = { "*" },
--   command = [[call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd))]],
-- })

-- Create a dedicated augroup to ensure the autocommand can be cleared and reloaded.
local autochdir_group = vim.api.nvim_create_augroup("SmartChdir", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = autochdir_group,
  pattern = "*",
  callback = function()
    -- Get the full path of the file in the buffer.
    local file_path = vim.fn.expand("%:p")

    -- Exit if the buffer is not associated with a file on disk (e.g., a new, unnamed buffer).
    if not vim.fn.filereadable(file_path) then
      return
    end

    -- Get the directory containing the file.
    local file_dir = vim.fn.expand("%:p:h")

    -- Use git's plumbing command to find the top-level directory of the repo.
    -- The '-C' flag tells git to run as if it were started in `file_dir`.
    -- `systemlist` executes the command and returns its output as a Lua table of lines.
    local git_root_list = vim.fn.systemlist({ "git", "-C", file_dir, "rev-parse", "--show-toplevel" })

    -- `vim.v.shell_error` is 0 if the last command succeeded.
    local is_in_git_repo = vim.v.shell_error == 0

    local target_dir

    if is_in_git_repo and git_root_list[1] then
      -- If the command succeeded, the target is the Git repository root.
      target_dir = git_root_list[1]
    else
      -- If not in a Git repo, the target is the file's own directory.
      target_dir = file_dir
    end

    -- Get the current working directory for the window.
    local current_dir = vim.fn.getcwd()

    -- To avoid unnecessary directory changes, only change if the target is different.
    -- This is the key to preventing directory changes for every file within the same project.
    if target_dir and target_dir ~= current_dir then
      -- Use :lcd (local change directory) to change directory only for the current window.
      -- `fnameescape` handles paths with spaces or special characters correctly.
      vim.cmd.lcd(vim.fn.fnameescape(target_dir))
    end
  end,
})
