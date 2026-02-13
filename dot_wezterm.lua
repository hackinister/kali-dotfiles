-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- font settings

config.font = wezterm.font("Iosevka Nerd Font Mono")
config.line_height = 1.2
config.font_size = 19

-- config.enable_tab_bar = false
-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 12,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/assets/bg-blurred-darker.png"
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

--Scrollback
config.scrollback_lines = 50000

-- keybindings
local act = wezterm.action
config.keys = {
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab,
	},
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.ToggleFullScreen },
	{ key = "s", mods = "SHIFT|CTRL", action = act.Search },
}

-- and finally, return the configuration to wezterm
return config
