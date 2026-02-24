local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = act.QuitApplication,
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "f",
		mods = "CTRL|SHIFT",
		action = act.ToggleFullScreen,
	},
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = act.Search("CurrentSelectionOrEmptyString"),
	},
	{ key = "Enter", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
}

return {
	keys = keys,
}
