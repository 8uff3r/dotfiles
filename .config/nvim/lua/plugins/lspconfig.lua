-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
      keys[#keys + 1] = { "<leader>ca", false, mode = { "n", "v" } }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<Space>ca", false, mode = { "n", "v" } }
      keys[#keys + 1] = { "<Space>cA", false }
      keys[#keys + 1] = { "<Space>cr", false }
      require("lazyvim.util").lsp.on_attach(function(_, buffer) end)
    end,
    opts = {
      -- options for vim.diagnostic.config()
      inlay_hints = { enabled = true },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      -- autoformat = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified

      -- Never request volar for formatting, because of wrong postcss formatting
      format = {
        filter = function(client)
          return client.name ~= "volar"
        end,
        formatting_options = nil,
        timeout_ms = 10000,
      },
      ---@type lspconfig.options
      servers = {
        volar = {
          init_options = {
            typescript = {
              tsdk = "/home/rylan/.local/share/pnpm/global/5/node_modules/typescript/lib/",
            },
          },
          settings = {
            vue = {
              autoInsert = {
                bracketSpacing = true,
                dotValue = true,
              },
              inlayHints = {
                inlineHandlerLeading = true,
                missingProps = true,
                optionsWrapper = true,
              },
            },
            typescript = {
              tsdk = "/home/rylan/.local/share/pnpm/global/5/node_modules/typescript/lib/",
              updateImportsOnFileMove = {
                enabled = "always",
              },
              preferences = {
                quoteStyle = "double",
                importModuleSpecifier = "relative",
              },
              autoClosingTags = true,
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
              implementationsCodeLens = true,
              inlayHints = {
                variableTypes = { enabled = false },
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = {
                  enabled = "all",
                  suppressWhenArgumentMatchesName = false,
                },
                parameterTypes = {
                  enabled = true,
                  suppressWhenTypeMatchesName = false,
                },
                propertyDeclarationTypes = { enabled = true },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
          -- filetypes = { "vue", "json" },
          cmd = { "/home/rylan/.local/share/pnpm/vue-language-server", "--stdio" },
        },
        gopls = {
          settings = {
            gopls = {
              staticcheck = true,
              codelenses = {
                gc_details = true,
                tidy = true,
                test = true,
                run_govulncheck = true,
                upgrade_dependency = true,
              },
              analyses = {
                fieldalignment = true,
                shadow = true,
              },
              hints = {
                compositeLiteralTypes = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        nim_langserver = {},
        rust_analyzer = {},
        stimulus_ls = {},
        phpactor = {},
        psalm = {},
        -- intelephense = {},
        -- tsserver = {},
        lua_ls = {
          autostart = false,
        },
      },
      setup = {
        tsserver = function(_, opt)
          return true
        end,
        intelephense = function(_, opt)
          return true
        end,
      },

      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts)
      -- end,
    },
  },
}
