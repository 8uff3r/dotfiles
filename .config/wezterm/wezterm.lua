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

-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({
--     options = {
--         section_separators = "",
--         component_separators = "",
--         tab_separators = "",
--         -- theme = "ayu",
--         -- theme_overrides = {
--         --     tab = {
--         --         inactive = { fg = "#35A3D9" },
--         --         active = { fg = "#ffffff", bg = "#181825" },
--         --         inactive_hover = { fg = "#f5c2e7", bg = "#313244" },
--         --     },
--         -- },
--     },
--     sections = {
--         tabline_a = { "mode" },
--         tabline_b = { "workspace" },
--         tabline_c = { " " },
--         tab_active = {
--             "index",
--             { "process", padding = { left = 0, right = 1 } },
--             { "parent",  padding = 0 },
--             "/",
--             { "cwd",    padding = { left = 0, right = 1 } },
--             { "zoomed", padding = 0 },
--         },
--         tab_inactive = {
--             "index",
--             { "cwd", padding = { left = 0, right = 1 } },
--         },
--         tabline_x = {},
--         tabline_y = { "battery" },
--         tabline_z = { "domain" },
--     },
-- })

local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local config = {
    bidi_enabled = true,
    bidi_direction = "AutoLeftToRight",
    disable_default_key_bindings = true,
    color_scheme = "ayu",
    enable_wayland = false,
    warn_about_missing_glyphs = false,
    window_background_opacity = 0.95,
    text_background_opacity = 0.95,
    harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig", "liga" },

    font = wezterm.font_with_fallback({
        { family = "Hack Nerd Font Mono",   weight = 400 },
        { family = "MonaspiceNe Nerd Font", weight = 400 },
        { family = "FiraCode Nerd Font",    weight = 450 },
        { family = "Jetbrains Mono",        weight = 480 },
        { family = "Symbols Nerd Font Mono" },
        { family = "Vazir Code",            weight = 600 },
    }),
    font_size = 13,
    font_rules = {
        {
            italic = true,
            font = wezterm.font_with_fallback({
                { family = "MonaspiceKr Nerd Font", weight = 500 },
                { family = "Jetbrains Mono",        weight = "DemiBold" },
            }),
        },
    },
    hide_tab_bar_if_only_one_tab = false,
    tab_bar_at_bottom = false,
    use_fancy_tab_bar = false,
    window_padding = {
        left = 0,
        right = 0,
        top = 5,
        bottom = 0,
    },
    default_prog = { "fish" },
    term = "wezterm",
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "NONE",
            action = wezterm.action.Nop,
        },
    },
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
        { key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
        { key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
        {
            key = "t",
            mods = "ALT",
            action = act.SpawnTab("CurrentPaneDomain"),
        },
        {
            key = "v",
            mods = "CTRL|SHIFT",
            action = act.PasteFrom("Clipboard"),
        },
        {
            key = "c",
            mods = "ALT",
            action = act.ActivateCopyMode,
        },
        {
            key = "q",
            mods = "ALT",
            action = act.QuickSelect,
        },
        {
            key = "f",
            mods = "ALT",
            action = act.Search("CurrentSelectionOrEmptyString"),
        },
        -- Workspace name change
        {
            key = "x",
            mods = "ALT",
            action = act.PromptInputLine({
                description = wezterm.format({
                    { Attribute = { Intensity = "Bold" } },
                    { Foreground = { AnsiColor = "Fuchsia" } },
                    { Text = "Enter name for new workspace" },
                }),
                action = wezterm.action_callback(function(window, pane, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        window:perform_action(
                            act.SwitchToWorkspace({
                                name = line,
                            }),
                            pane
                        )
                    end
                end),
            }),
        },
        {
            key = "9",
            mods = "ALT",
            action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
        },
        { key = "v", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
        {
            key = "r",
            mods = "ALT",
            -- action = wezterm.action_callback(function(win, pane)
            -- 	wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), "something different")
            -- end),
            action = act.PromptInputLine({
                description = wezterm.format({
                    { Attribute = { Intensity = "Bold" } },
                    { Foreground = { AnsiColor = "Fuchsia" } },
                    { Text = "Change the name of current workspace" },
                }),
                action = wezterm.action_callback(function(window, pane, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
                    end
                end),
            }),
        },

        -- Resurrect
        {
            key = "s",
            mods = "ALT",
            action = wezterm.action_callback(function(win, pane)
                resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
                resurrect.window_state.save_window_action()
            end),
        },
        {
            key = "o",
            mods = "ALT",
            action = wezterm.action_callback(function(win, pane)
                resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
                    local type = string.match(id, "^([^/]+)") -- match before '/'
                    id = string.match(id, "([^/]+)$")         -- match after '/'
                    id = string.match(id, "(.+)%..+$")        -- remove file extention
                    local opts = {
                        relative = true,
                        restore_text = true,
                        pane = pane,
                        win = win,
                        close_open_panes = true,
                        close_open_tabs = true,
                        spawn_in_workspace = true,
                        on_pane_restore = resurrect.tab_state.default_on_pane_restore,
                    }
                    if type == "workspace" then
                        local state = resurrect.state_manager.load_state(id, "workspace")
                        resurrect.workspace_state.restore_workspace(state, opts)
                        wezterm.mux.set_active_workspace(id)
                    elseif type == "window" then
                        local state = resurrect.state_manager.load_state(id, "window")
                        resurrect.window_state.restore_window(pane:window(), state, opts)
                    elseif type == "tab" then
                        local state = resurrect.state_manager.load_state(id, "tab")
                        resurrect.tab_state.restore_tab(pane:tab(), state, opts)
                    end
                end)
            end),
        },
    },
}
-- tabline.apply_to_config(config)

return config
