return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      default_format_opts = {
        -- These options will be passed to conform.format()
        async = false,
        timeout_ms = 10500,
        lsp_fallback = true,
      },
      -- Map of filetype to formatters
      formatters_by_ft = {
        scheme = { "schemat" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        clojure = { "cljfmt" },
        javascript = { { "prettierd", "prettier", "dprint" } },
        html = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier", "dprint" } },
        typescriptreact = { { "prettierd", "prettier", "dprint" } },
        jsx = { { "prettierd", "prettier", "dprint" } },
        json = { { "prettierd", "prettier", "dprint" } },
        vue = { { "prettierd", "prettier" } },
        php = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        dart = { "dart" },
        ocaml = { "ocamlformat" },
        -- Use the "*" filetype to run formatters on all files.
        -- Note that if you use this, you may want to set lsp_fallback = "always"
        -- (see :help conform.format)
        ["*"] = { "trim_whitespace" },
      },
      formatters = {
        cljfmt = {
          command = "cljfmt",
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
        schemat = {
          command = "/home/rylan/.cargo/bin/schemat",
          args = { "$FILENAME" },
          stdin = false,
        },
        dart = {
          command = "/home/rylan/.flutter/bin/dart",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
        prettierd = {
          command = "/home/rylan/.local/share/pnpm/prettierd",
          args = { "$FILENAME" },
          stdin = true,
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
