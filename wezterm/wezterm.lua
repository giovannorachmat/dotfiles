local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	term = "xterm-kitty",
	enable_kitty_graphics = true,

	color_scheme = "Catppuccin Mocha",
	font_size = 21.0,

	max_fps = 120,
	cursor_blink_rate = 0,

	enable_tab_bar = false,
	default_cursor_style = "SteadyBlock",
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	scrollback_lines = 10000,
	-- macos_window_background_blur = 5,
	-- window_background_opacity = 0.9,
}

return config
