return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    return {
      options = {
        separator_style = "sloped",
        numbers = "ordinal",
        always_show_bufferline = true,
        buffer_close_icon = "",
      },
    }
  end,
}
