return {
  "luckasRanarison/tailwind-tools.nvim",
  enabled = false,
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    extension = {
      queries = { "rust" },
      patterns = {
        rust = { 'class: "(.*)"' },
      },
    },
  }, -- your configuration
}
