return {
  "glepnir/lspsaga.nvim",
  enabled = true,
  event = "BufRead",
  keys = {
    { "<leader>aa", "<cmd>Lspsaga code_action<cr>", desc = "Code actions" },
    { "<leader>ar", "<cmd>Lspsaga rename ++project<cr>", desc = "Rename" },
    { "<leader>af", "<cmd>Lspsaga lsp_finder<cr>", desc = "LSP finder" },
    { "<leader>af", "<cmd>Lspsaga finder<cr>", desc = "Finder" },
    { "<leader>al", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show line diagnostics" },
    { "<leader>ab", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Show buffer diagnostics" },
    { "<leader>ac", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Show cursor diagnostics" },
    { "<leader>ai", "<cmd>Lspsaga incoming_calls<cr>", desc = "Show incoming calls" },
    { "<leader>au", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Show outgoing calls" },
    { "<leader>ap", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
    { "<leader>at", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
    { "<leader>ah", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
    { "<leader>ao", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  },
  opts = {
    finder = {
      default = "def+ref+imp",
    },
    lightbulb = {
      enable = true,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    ui = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- Currently, only the round theme exists
      theme = "round",
      -- This option only works in Neovim 0.9
      devicon = true,
      title = true,
      colors = {
        normal_bg = "#002b36",
      },
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "",
      diagnostic = "  ",
      incoming = "  ",
      outgoing = "  ",
      hover = "   ",
      kind = {},
      beacon = {
        enable = true,
        frequency = 7,
      },
    },
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
    { "neovim/nvim-lspconfig" },
  },
}
