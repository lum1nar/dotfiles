-- Pull in the wezterm API

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Basic settings
config.initial_cols = 180
config.initial_rows = 28
config.font_size = 12
config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("0xProto Nerd Font")
-- config.font = wezterm.font("Jetbrains Mono Nerd Font", { weight = "Medium" })
--
config.front_end = "Software"

config.window_background_opacity = 0.95

config.underline_thickness = "1.5pt"

config.enable_tab_bar = false
--
config.max_fps = 120
config.animation_fps = 120

config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650
config.scrollback_lines = 50000

config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
}

-- wezterm.on("gui-startup", function()
-- 	local tab, pane, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

-- Finally, return the configuration to wezterm:
return config
