return {
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "fzy", "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({})
    end,
    keys = {
      { "<leader>rr", "<Plug>RestNvim", desc = "Run REST request" },
    },
  },
}
