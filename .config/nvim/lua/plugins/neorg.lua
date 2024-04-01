return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  run = ":Neorg sync-parsers",
  opts = {},
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.keybinds"] = {}, -- Loads default behaviour
      ["core.concealer"] = {
        config = {
          icon_preset = "varied",
        },
      }, -- Adds pretty icons to your documents
      ["core.integrations.treesitter"] = {},
      ["core.dirman.utils"] = {},
      ["core.esupports.hop"] = {},
      ["core.clipboard.code-blocks"] = {},
      ["core.integrations.nvim-cmp"] = {},
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/Documents/Notes/",
          },
          default_workspace = "notes",
        },
      },
      ["core.integrations.telescope"] = {},
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
}
