-- local toggle_term_cmd = helpers.toggle_term_cmd
-- local python = vim.fn.executable("python") == 1 and "python" or vim.fn.executable("python3") == 1 and "python3"

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    shell = "fish",
  },
  config = function()
    require("toggleterm").setup()
  end,
}
