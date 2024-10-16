return {
  "folke/which-key.nvim", -- dependencies = {'mrjones2014/legendary.nvim'}
  opts = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("legendary").setup({ extensions = { which_key = { auto_register = true } } })
    local wk = require("which-key")
    wk.add({
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>a", group = "LSPSaga" },
      { "<leader>r", group = "Run" },
      { "<leader>n", group = "Neorg" },
    })
  end,
}
