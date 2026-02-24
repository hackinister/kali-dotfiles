local wezterm = require("wezterm")
local color_assets = require("01-assets").colors
local utf8 = require("utf8")

local TERMINAL_ICON_WITH_PADDING = utf8.char(0xE795) -- 
local M = {}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "lovelace",
		color_overrides = {
			normal_mode = {
				a = { bg = color_assets.lt_green },
			},
			tab = {
				active = { fg = color_assets.lt_black, bg = color_assets.lt_orange },
				inactive = { fg = color_assets.warm_white },
				inactive_hover = { fg = color_assets.lt_gray, bg = color_assets.nut_gray },
			},
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = {
			{
				"mode",
				padding = 1,
				fmt = function()
					return TERMINAL_ICON_WITH_PADDING
				end,
			},
		},
		tabline_b = {}, -- workspaces
		tabline_x = { "ram", "cpu" }, --\
		tabline_y = { "datetime" }, -- batteries and stuff
		tabline_z = {}, --/
	},
})

M.tabline = tabline

return M
