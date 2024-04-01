return {
  {
    "ray-x/navigator.lua",
    enabled = false,
    dependencies = {
      { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "numToStr/Comment.nvim",
      "ray-x/lsp_signature.nvim",
    },
    config = function()
      require("navigator").setup({
        on_attach = function(client, bufnr)
          -- require("lsp_signature").on_attach()
        end,
        transparency = 50,
        lsp_signature_help = true,
        -- signature_help_cfg = nil,
        -- lsp_signature_help = {
        --   bind = true,
        --   doc_lines = 0,
        --   max_height = 10,
        --   max_width = 80,
        --   wrap = true,
        --   floating_window = true,
        --   floating_window_above_cur_line = true,
        --   floating_window_off_x = 1,
        --   floating_window_off_y = 0,
        --   fix_pos = false,
        --   hint_enable = true,
        --   hi_parameter = "LspSignatureActiveParameter",
        --   toggle_key = "<C-x>",
        --   hint_scheme = "Comment",
        --   handler_opts = {
        --     border = "rounded",
        --   },
        -- },
        ts_fold = false,
        mason = true,
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        icons = {
          icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
          -- Code action
          code_action_icon = " ",
          -- code lens
          code_lens_action_icon = "󰧶 ",
          -- Diagnostics
          diagnostic_head = "󱍌 ",
          diagnostic_err = " ",
          diagnostic_warn = " ",
          diagnostic_info = [[ ]],
          diagnostic_hint = [[󰘥 ]],

          diagnostic_virtual_text = "",
          diagnostic_file = " ",
          -- Values
          value_changed = "󰌇 ",
          value_definition = " ", -- it is easier to see than 🦕
          side_panel = {
            section_separator = "󰇜",
            line_num_left = "",
            line_num_right = "",
            inner_node = "├○",
            outer_node = "╰○",
            bracket_left = "⟪",
            bracket_right = "⟫",
          },
        },

        lsp = {
          enable = true,
          disable_lsp = { "lua_ls" },
          format_on_save = {
            disable = { "vue" },
          },
          display_diagnostic_qf = true,
          inlay_hints = { enabled = true },
          diagnostics = {
            underline = true,
            update_in_insert = false,
            virtual_text = { spacing = 4, prefix = "●" },
            severity_sort = true,
          },
          code_action = {
            delay = -1,
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
            virtual_text_icon = true,
          },
          code_lens_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
            virtual_text_icon = true,
          },
          --servers
          tsserver = { filetypes = {} },
          denols = { filetypes = {} },
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
        },
      })
    end,
  },

  { "alaviss/nim.nvim" },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({})
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    config = function()
      require("lsp_signature").setup({
        fix_pos = false,
        bind = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        zindex = 1002,
        noice = true,
        always_trigger = false,
        timer_interval = 100,
        extra_trigger_chars = {},
        handler_opts = {
          border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
        },
        hi_parameter = "Blue",
        hint_enable = false,
        hint_inline = false,
        hint_prefix = "",
        max_height = 4,
        toggle_key = [[<M-x>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
        -- select_signature_key = [[<M-n>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
        select_signature_key = [[<M-c>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
        -- doc_lines = 4,
        -- floating_window_above_first = true,
        -- log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
        -- debug = plugin_debug(),
        -- verbose = plugin_debug(),
        -- hi_parameter = "Search",
      })
    end,
  },
}
