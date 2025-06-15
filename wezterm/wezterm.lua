local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config = {
	term = "xterm-kitty",
	enable_kitty_graphics = true,

	color_scheme = "rose-pine",
	font_size = 16.0,

	max_fps = 120,
	cursor_blink_rate = 0,

	enable_tab_bar = false,
	default_cursor_style = "SteadyBlock",
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	scrollback_lines = 10000,
	window_background_opacity = 0.87,
	-- text_background_opacity = 0.6,
}

config.keys = {
	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({ key = "b", mods = "OPT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "OPT" }),
	},
}

return config
