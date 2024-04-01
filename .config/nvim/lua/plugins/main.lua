return {
  { "Shatur/neovim-session-manager" },
  {
    "aserowy/tmux.nvim",
    opts = {},
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
    keys = {
      { "<A-l>", "<cmd>tabnext<cr>", { desc = "tabnext" } },
      { "<A-h>", "<cmd>tabprevious<cr>", { desc = "tabprev" } },
      { "<A-t>", "<cmd>tabnew<cr>", { desc = "tabnew" } },
      { "<A-c>", "<cmd>tabclose<cr>", { desc = "tabclose" } },
    },
  },
  { "mrjones2014/smart-splits.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require("colorizer").setup({
        "css",
        "javascript",
      })
    end,
  },
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = true },
  {
    "mustache/vim-mustache-handlebars",
  },
  --  { "https://github.com/nikvdp/neomux" },
  {
    "acksld/nvim-neoclip.lua",
    keys = {
      { "<leader>y", "<cmd>Telescope neoclip<cr>" },
    },
    opts = {
      enable_persistent_history = true,
    },
  },
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify", -- optional
    opts = {
      slots = { "a", "b", "c" },
    }, -- required even with default settings, since it calls `setup()`
  },
  {
    "echasnovski/mini.hipatterns",
    opts = {
      tailwind = {
        ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html", "vue", "svelte" },
      },
    },
  },

  -- Disabled plugins
  { "echasnovski/mini.comment", enabled = false },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "minimal",
      stages = "fade",
      timeout = 3000,
      top_down = false,
    },
  },
  { "nvimtools/none-ls.nvim", enabled = false },
  {
    "HampusHauffman/block.nvim",
    opts = {
      percent = 1.5,
      depth = 4,
      colors = nil,
      automatic = false,
      bg = nil,
    },
  },
}
--0W"byedt'va'gsa(0iconst "bpa=j
