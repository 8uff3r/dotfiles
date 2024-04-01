return {
  "folke/which-key.nvim", -- dependencies = {'mrjones2014/legendary.nvim'}
  opts = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("legendary").setup({ which_key = { auto_register = true } })
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        w = {
          name = "+window",
          w = { "<C-W>p", "Other window" },
          d = { "<C-W>c", "Delete window" },
          s = { "<C-W>s", "Split window" },
          v = { "<C-W>v", "Split window vertically" },
          h = { "<C-W>h", "Go to the left window" },
          j = { "<C-W>j", "Go to the down window" },
          k = { "<C-W>k", "Go to the up window" },
          l = { "<C-W>l", "Go to the right window" },
          x = { "<C-W>v", "Swap current with next" },
        },
        t = { name = "+Terminal" },
        a = { name = "+LSPSaga" },
        r = { name = "+Run" },
      },
    })
    return {
      window = {
        border = "single",
        position = "top",
      },
    }
  end,
}
