return {
  { "Shatur/neovim-session-manager" },
  {
    "aserowy/tmux.nvim",
    enabled = false,
    opts = {
      enable_default_keybindings = false,
    },
    keys = {
      { "<C-h>", '<cmd>lua require("tmux").move_left()<cr>' },
      { "<C-j>", '<cmd>lua require("tmux").move_bottom()<cr>' },
      { "<C-k>", '<cmd>lua require("tmux").move_top()<cr>' },
      { "<C-l>", '<cmd>lua require("tmux").move_right()<cr>' },
    },
    lazy = false,
  },
  {
    "tiagovla/scope.nvim",
    enabled = false,
    opts = {},
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
  -- { "echasnovski/mini.comment", enabled = false },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      render = "minimal",
      stages = "fade",
      timeout = 3000,
      top_down = false,
    },
  },
  { "nvimtools/none-ls.nvim", enabled = false },
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "VeryLazy",
    version = "*",
    keys = {
      -- One handed keymap recommended, you will be using the mouse
      {
        "<leader>v",
        function()
          require("oklch-color-picker").pick_under_cursor()
        end,
        desc = "Color pick under cursor",
      },
    },
    ---@type oklch.Opts
    opts = {},
  },
}
