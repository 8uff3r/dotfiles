return {
  "folke/trouble.nvim",
  opts = {
    {
      icons = true,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = true, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info",
      },
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
}
