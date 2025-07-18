return {
  "stevearc/conform.nvim",
  opts = function()
    local prettier = { "prettierd", "prettier", stop_after_first = true }
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
        javascript = prettier,
        html = prettier,
        typescript = { "biome", "prettier", "prettierd", stop_after_first = true },
        typescriptreact = prettier,
        jsx = prettier,
        json = prettier,
        vue = prettier,
        php = prettier,
        svelte = prettier,
        yaml = prettier,
        css = prettier,
        scss = prettier,
        dart = { "dart" },
        go = { "gofmt" },
        ocaml = { "ocamlformat" },
        rust = { "rustfmt" },
        atd = { "ocamlformat_for_atd" },
        -- Use the "*" filetype to run formatters on all files.
        -- Note that if you use this, you may want to set lsp_fallback = "always"
        -- (see :help conform.format)
        ["*"] = { "trim_whitespace" },
      },
      formatters = {
        leptosfmt = {
          command = "leptosfmt",
          args = { "--stdin", "--rustfmt" },
          stdin = true,
        },
        biome = {
          require_cwd = true,
        },
        cljfmt = {
          command = "cljfmt",
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
        ocamlformat_for_atd = {
          command = "ocamlformat",
          args = { "--enable-outside-detected-project", "--intf", "-" },
          stdin = true,
        },
        schemat = {
          command = "/home/rylan/.cargo/bin/schemat",
          args = { "$FILENAME" },
          stdin = false,
        },
        dart = {
          command = "/home/rylan/.flutter_sdk/bin/dart",
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
