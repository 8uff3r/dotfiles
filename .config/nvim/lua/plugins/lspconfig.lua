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
      -- keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<CR>" }
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
        -- tailwindcss = {
        --   filetypes = { "rust" },
        --   settings = {
        --     tailwindCSS = {
        --       experimental = {
        --         classRegex = { 'class: "([^"]*)",' },
        --         -- classRegex = { { "class: ([^,]*),", "'([^']*)'" }, { "class: ([^,]*),", '"([^"]*)"' } },
        --       },
        --       includeLanguages = {
        --         rust = "html",
        --       },
        --     },
        --   },
        -- },
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
              -- hints = {
              --   compositeLiteralTypes = true,
              --   constantValues = true,
              --   parameterNames = true,
              --   rangeVariableTypes = true,
              -- },
            },
          },
        },
        rust_analyzer = {
          mason = false,
          enabled = false,
        },
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
          settings = {
            typescript = {
              disableAutomaticTypeAcquisition = true,
            },
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
          },
        },
        lua_ls = {
          autostart = false,
        },
      },
      setup = {
        ["scheme_ls"] = function(server, opts)
          return {
            filetypes = { "scheme" },
            cmd = {
              "/nix/store/755sx7hgvb341xgziya94wbbpxgbx3bj-scheme-langserver-1.2.1/bin/scheme-langserver",
              "~/.var/log/scheme-langserver.log",
              "enable",
              "disable",
            }, -- Command to start the server
            name = "scheme-langserver",
            root_dir = require("lspconfig").util.root_pattern(".git", ".gitignore", "AKKU.manifest"), -- Define how to find the root directory
            init_options = {},
            on_attach = function(client, bufnr)
              -- Set up key mappings once the server attaches to the buffer
              local opts = { noremap = true, silent = true }
              vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
              vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            end,
            settings = {
              myCustomSetting = true, -- Add any server-specific settings
            },
          }
        end,
      },

      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts)
      -- end,
    },
  },
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
