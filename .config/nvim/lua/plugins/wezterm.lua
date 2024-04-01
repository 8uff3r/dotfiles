function is_nvim_border(border)
  return winnr() == winnr("1" .. border)
end

function winnr(direction)
  return vim.api.nvim_call_function("winnr", { direction })
end

function wincmd(direction, count)
  return vim.api.nvim_command((count or 1) .. "wincmd " .. direction)
end
function to(direction)
  local wez = require("wezterm")
  local convert = { Up = "k", Down = "j", Right = "l", Left = "h" }
  local vd = convert[direction]

  local opposite_directions = {
    h = "l",
    j = "k",
    k = "j",
    l = "h",
  }

  local is_nvim_border = is_nvim_border(vd)
  if is_nvim_border then
    wez.switch_pane.direction(direction)
  elseif is_nvim_border and options.navigation.cycle_navigation then
    wincmd(opposite_directions[vd], 999)
  elseif not is_nvim_border then
    wincmd(vd)
  end
end

return {
  "8uff3r/wezterm.nvim",
  enabled = false,
  keys = {
    -- {
    --   "<A-CR>",
    --   function()
    --     local wez = require("wezterm")
    --     wez.split_pane.vertical({ cwd = vim.fn.getcwd(), percent = 30 })
    --   end,
    -- },
    {
      "<C-j>",
      function()
        to("Down")
      end,
    },
    {
      "<C-k>",
      function()
        to("Up")
      end,
    },
    {
      "<C-h>",
      function()
        to("Left")
      end,
    },
    {
      "<C-l>",
      function()
        to("Right")
      end,
    },
  },
  config = true,
}
