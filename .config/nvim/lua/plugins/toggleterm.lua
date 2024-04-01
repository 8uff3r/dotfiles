return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    -- keys = {
    --   { "<leader>ts", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
    --   { "<C-'>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
    --   { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical terminal" },
    --   { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
    -- },
    opts = function()
      return {
        shell = "/bin/fish",
        close_on_exit = true,
        autochdir = true,

        open_mapping = [[<c-'>]],
        float_opts = {
          border = "curved",
        },
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
      }
    end,
  },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = true,
  },
}
