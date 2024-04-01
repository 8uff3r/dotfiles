return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    window = {
      position = "left",
      width = 20,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = true,
      find_args = { -- you can specify extra args to pass to the find command.
        fd = {
          "--max-depth",
          "1",
        },
        find = {
          "-maxdepth",
          1,
        },
      },
    },
  },
}
