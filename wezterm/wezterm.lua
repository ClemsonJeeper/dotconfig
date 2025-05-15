local wezterm = require "wezterm"
local act = wezterm.action

local config = wezterm.config_builder()

local is_macos = function()
    return wezterm.target_triple:find("apple") ~= nil
end

local is_windows = function()
    return wezterm.target_triple:find("windows") ~= nil
end

config.selection_word_boundary = ' \\()"\':;<>~!#$%^&*|+=[]{}~?│'

if is_windows() then
    config.default_domain = 'WSL:Ubuntu-24.04'
    config.keys = {
        { key = "1", mods = "ALT", action = act.ActivateTab(0) },
        { key = "2", mods = "ALT", action = act.ActivateTab(1) },
        { key = "3", mods = "ALT", action = act.ActivateTab(2) },
        { key = "4", mods = "ALT", action = act.ActivateTab(3) },
        { key = "5", mods = "ALT", action = act.ActivateTab(4) },
        { key = "6", mods = "ALT", action = act.ActivateTab(5) },
        { key = "7", mods = "ALT", action = act.ActivateTab(6) },
        { key = "8", mods = "ALT", action = act.ActivateTab(7) },
        { key = "9", mods = "ALT", action = act.ActivateTab(8) },
    }
    config.font_size = 11
else
    config.font_size = 13
end

config.initial_cols = 190
config.initial_rows = 56

local scheme = wezterm.get_builtin_color_schemes()["Derp (terminal.sexy)"]
scheme.foreground = "#c4c4c4"
scheme.ansi[1] = "#111111"
scheme.ansi[5] = "#0040c7"
scheme.ansi[7] = "#5297cf"

scheme.brights[5] = "#001bef"
scheme.brights[7] = "#74b8ef"

config.color_schemes = {
    ["rjohnst"] = scheme, 
}

config.color_scheme = "rjohnst"

return config
