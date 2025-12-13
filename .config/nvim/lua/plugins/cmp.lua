return {
  "saghen/blink.cmp",
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    completion = {
      menu = { border = "single" },
      documentation = { window = { border = "single" } },
    },
    -- completion = {
    --   -- keyword = {
    --   --   range = "full",
    --   -- },
    --   trigger = {
    --     show_on_keyword = true,
    --     prefetch_on_insert = true,
    --     show_on_trigger_character = true,
    --     show_on_insert_on_trigger_character = true,
    --     show_on_accept_on_trigger_character = true,
    --   },
    --   menu = {
    --     border = {
    --       { "󱐋", "WarningMsg" },
    --       "─",
    --       "╮",
    --       "│",
    --       "╯",
    --       "─",
    --       "╰",
    --       "│",
    --     },
    --   },
    --   documentation = {
    --     window = {
    --       border = {
    --         { "", "DiagnosticHint" },
    --         "─",
    --         "╮",
    --         "│",
    --         "╯",
    --         "─",
    --         "╰",
    --         "│",
    --       },
    --     },
    --     treesitter_highlighting = true,
    --   },
    --   ghost_text = { enabled = true },
    -- },
    signature = {
      window = {
        border = {
          "╭",
          "─",
          "╮",
          "│",
          "╯",
          "─",
          "╰",
          "│",
        },
      },
      enabled = true,
    },
  },
}
