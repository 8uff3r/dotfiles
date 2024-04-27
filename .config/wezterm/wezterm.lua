local wezterm = require("wezterm")
local act = wezterm.action
local actc = wezterm.action_callback

function nvim_pane_rev(direction)
	local convert = { Up = "k", Down = "j", Right = "l", Left = "h" }

	local M = {}

	M.action = actc(function(win, pane)
		if pane:get_foreground_process_info().name == "nvim" then
			win:perform_action(
				act.SendKey({
					key = convert[direction],
					mods = "CTRL",
				}),
				pane
			)
			return
		end
		win:perform_action(act.ActivatePaneDirection(direction), pane)
	end)

	M.key = convert[direction]
	M.mods = "CTRL"

	return M
end

return {
	bidi_enabled = true,
	bidi_direction = "AutoLeftToRight",
	disable_default_key_bindings = true,
	color_scheme = "ayu",
	enable_wayland = false,

	font = wezterm.font_with_fallback({
		{ family = "Jetbrains Mono", weight = 480 },
		{ family = "Symbols Nerd Font Mono" },
		{ family = "Vazir Code", weight = "DemiBold" },
	}),
	font_size = 14,
	font_rules = {
		{
			italic = true,
			font = wezterm.font({
				family = "Jetbrains Mono",
				weight = "DemiBold",
				-- style = "Normal",
			}),
		},
	},
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 5,
		bottom = 0,
	},
	default_prog = { "fish" },
	term = "wezterm",
	keys = {
		nvim_pane_rev("Down"),
		nvim_pane_rev("Up"),
		nvim_pane_rev("Right"),
		nvim_pane_rev("Left"),
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 20 },
			}),
		},
		{
			key = "Enter",
			mods = "ALT|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},
	},
}
