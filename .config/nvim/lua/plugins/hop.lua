return {
  "phaazon/hop.nvim",
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    --place this in one of your configuration file(s)
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    vim.keymap.set("", "f", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "F", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "t", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
    end, { remap = true })
    vim.keymap.set("", "T", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
    end, { remap = true })
    vim.keymap.set("", "s", function()
      hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "S", function()
      hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "<A-w>", function()
      hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "<A-W>", function()
      hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })
    require("hop").setup({
      multi_windows = true,
    })
  end,
}
