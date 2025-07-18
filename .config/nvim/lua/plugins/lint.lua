return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      typescript = { "oxlint" },
      vue = { "oxlint" },
    },
    linters = {
      oxlint = {
        condition = function()
          return true
        end,
      },
    },
  },
}
