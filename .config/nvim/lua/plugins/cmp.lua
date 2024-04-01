local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end
return {
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = { "onsails/lspkind.nvim" },
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = {
      -- formatting = {
      --   format = require('lspkind').cmp_format({
      --     mode = 'symbol', -- show only symbol annotations
      --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      --     The function below will be called before any actual modifications from lspkind
      --     so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      --     before = function(entry, vim_item)
      --       return vim_item
      --     end
      --   })
      -- }
      window = {
        completion = {
          border = border("CmpBorder"),
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          autocomplete = true,
        },
        documentation = {
          border = border("CmpDocBorder"),
        },
        -- sources = require("cmp").config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      },
    },
  },
  {
    "tzachar/cmp-ai",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      max_lines = 100,
      provider = "Ollama",
      provider_options = {
        model = "magicoder",
      },
      notify = true,
      notify_callback = function(msg)
        vim.notify(msg)
      end,
      run_on_every_keystroke = true,
      ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        ["*"] = true,
        typescript = false,
        vue = false,
      },
    },
  },
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "mistral-local",
    },
  },
}
