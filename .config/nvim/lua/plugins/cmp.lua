return {
  {
    "saghen/blink.cmp",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      completion = {
        menu = {
          border = {
            { "󱐋", "WarningMsg" },
            "─",
            "╮",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          },
        },
        documentation = {
          window = {
            border = {
              { "", "DiagnosticHint" },
              "─",
              "╮",
              "│",
              "╯",
              "─",
              "╰",
              "│",
            },
          },
          treesitter_highlighting = true,
        },
        ghost_text = { enabled = true },
      },
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
        enabled = false,
      },
    },
  },
}
