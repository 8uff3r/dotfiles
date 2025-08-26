-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Create a dedicated augroup to ensure the autocommand can be cleared and reloaded.
local autochdir_group = vim.api.nvim_create_augroup("SmartChdir", { clear = true })

--- A list of filenames that indicate the root of a project.
-- You can easily add or remove file names from this list to suit your projects.
local root_markers = {
  "package.json", -- Node.js/NPM project
  "cargo.toml", -- Rust/Cargo project
  "go.mod", -- Go project
  "pubspec.yaml", -- Dart/Flutter project
  "pyproject.toml", -- Python/Poetry/PEP 518 project
  "pom.xml", -- Java/Maven project
  "build.gradle", -- Java/Gradle project
  "mix.exs", -- Elixir/Mix project
}

--- Searches for a project root marker by traversing up the directory tree.
-- @param start_dir string The directory to start searching from.
-- @param markers table A list of file names to search for.
-- @return string|nil The path to the project root directory if found, otherwise nil.
local function find_project_root(start_dir, markers)
  local current_dir = start_dir
  -- A loop to walk up the directory tree until we hit the filesystem root.
  while current_dir ~= "/" and current_dir do
    -- Check for the existence of any of the marker files.
    for _, marker in ipairs(markers) do
      if vim.fn.filereadable(current_dir .. "/" .. marker) == 1 then
        return current_dir
      end
    end
    -- Move up one directory.
    current_dir = vim.fn.fnamemodify(current_dir, ":h")
  end
  return nil -- Return nil if no project root is found.
end

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
    local target_dir

    -- Step 1: Try to find a project root using our custom list of markers.
    local project_root = find_project_root(file_dir, root_markers)
    if project_root then
      target_dir = project_root
    else
      -- Step 2: If no marker is found, fall back to 'git rev-parse'.
      local git_root_list = vim.fn.systemlist({ "git", "-C", file_dir, "rev-parse", "--show-toplevel" })
      local is_in_git_repo = vim.v.shell_error == 0

      if is_in_git_repo and git_root_list[1] then
        -- The target is the Git repository root.
        target_dir = git_root_list[1]
      else
        -- Last resort: the target is the file's own directory.
        target_dir = file_dir
      end
    end

    -- Get the current working directory for the window.
    local current_dir = vim.fn.getcwd()

    -- To avoid unnecessary directory changes, only change if the target is different.
    if target_dir and target_dir ~= current_dir then
      -- Use :lcd (local change directory) to change directory only for the current window.
      -- `fnameescape` handles paths with spaces or special characters correctly.
      vim.cmd.lcd(vim.fn.fnameescape(target_dir))
    end
  end,
})
