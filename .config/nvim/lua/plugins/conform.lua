return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      format = {
        -- These options will be passed to conform.format()
        async = false,
        timeout_ms = 10500,
        lsp_fallback = true,
      },
      -- Map of filetype to formatters
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier", "dprint" } },
        html = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier", "dprint" } },
        json = { { "prettierd", "prettier", "dprint" } },
        vue = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        -- Use the "*" filetype to run formatters on all files.
        -- Note that if you use this, you may want to set lsp_fallback = "always"
        -- (see :help conform.format)
        ["*"] = { "trim_whitespace" },
      },
      formatters = {
        prettierd = {
          command = "/home/rylan/.local/share/pnpm/prettierd",
        },
        rustywind = {
          command = "/home/rylan/.cargo/bin/rustywind",
          args = { "--stdin" },
          stdin = true,
        },
        dprint = {
          command = "/home/rylan/.dprint/bin/dprint",
          args = { "fmt", "--stdin", "$FILENAME" },
          stdin = true,
          cwd = require("conform.util").root_file({ "dprint.json" }),
        },
      },
    }
  end,
}
