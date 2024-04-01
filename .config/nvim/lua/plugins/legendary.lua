return {
  "mrjones2014/legendary.nvim",
  lazy = true,
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = { "kkharji/sqlite.lua", "folke/which-key.nvim" },
  config = function()
    require("legendary").setup({
      keymaps = {
        { "<leader>sl", "<cmd>Legendary<cr>", description = "Legendary" },
      },
      which_key = { auto_register = true },
    })
  end,
}
