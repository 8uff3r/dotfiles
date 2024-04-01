return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>.", "<cmd>Telescope file_browser<cr>", desc = "Browse current directory" },
      { "<leader>h", "<cmd>Telescope file_browser path=~/<cr>", desc = "Browse $Home directory" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<A-x>", "<cmd>Telescope commands<cr>", desc = "Commands" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        pickers = {
          buffers = {
            mappings = {
              n = {
                ["d"] = "delete_buffer",
              },
              i = {
                ["<C-S-d>"] = "delete_buffer",
              },
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
            file_browser = {
              theme = "ivy",
              hijack_netrw = true,
            },
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("projects")
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  { "nvim-telescope/telescope-ui-select.nvim", opts = true, dependencies = { "nvim-telescope/telescope.nvim" } },
  { "ahmedkhalf/project.nvim", opts = true, dependencies = { "nvim-telescope/telescope.nvim" } },
}
