return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
  },
  opts = {
    status = {
      recent_commit_count = 30,
    },
  },
}
