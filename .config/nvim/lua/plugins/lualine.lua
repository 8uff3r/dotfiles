return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "ayu",
      },
      sections = {
        lualine_c = {
          { "filename", file_status = true, newfile_status = true, color = { fg = "#81F4FC" }, path = 3 },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("recorder").displaySlots,
          },
          {
            require("recorder").recordingStatus,
          },
        },
      },
    })
  end,
}
