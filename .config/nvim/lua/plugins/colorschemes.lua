return {
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    -- config = function()
    --   vim.g.ayu_extended_palette = 1
    --   vim.g.ayu_sign_contrast = 1
    --   require("ayu").setup({
    --     mirage = false,
    --     overrides = {
    --       Normal = { bg = "None" },
    --       NormalFloat = { bg = "none" },
    --       ColorColumn = { bg = "None" },
    --       SignColumn = { bg = "None" },
    --       Folded = { bg = "None" },
    --       FoldColumn = { bg = "None" },
    --       CursorLine = { bg = "None" },
    --       CursorColumn = { bg = "None" },
    --       VertSplit = { bg = "None" },
    --       Pmenu = {
    --         bg = "None",
    --       },
    --       WhichKeyBorder = {
    --         fg = "#FFB454",
    --       },
    --       LspInlayHint = { fg = "#6E6A86", bg = "#221F2E" },
    --       TabLineFill = { bg = "None" },
    --     },
    --
    --     -- overrides = {
    --     --   Normal = {
    --     --     bg = "#07070D",
    --     --   },
    --     --   Pmenu = {
    --     --     bg = "#07070D",
    --     --   },
    --     --   NormalFloat = {
    --     --     bg = "#07070D",
    --     --   },
    --     --   WhichKeyFloat = {
    --     --     bg = "#07070D",
    --     --   },
    --     --   WhichKeyBorder = {
    --     --     fg = "#FFB454",
    --     --   },
    --     --   LspInlayHint = { fg = "#6E6A86", bg = "#221F2E" },
    --     -- }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
    --   })
    --
    --   vim.opt.background = "dark" -- set this to dark or light
    -- end,
  },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = false, enabled = false },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      styles = {
        transparency = true,
      },
      highlight_groups = {
        Keyword = { fg = "orange" },
        Normal = {
          bg = "#0E0B13",
          -- fg = "#0F1419",
        },
      },
    },
  },
  { "EdenEast/nightfox.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-dark",
    },
  },
}
