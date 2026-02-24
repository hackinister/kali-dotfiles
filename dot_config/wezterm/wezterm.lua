-- Pull in the wezterm API
require("99-plugins")
local wezterm = require("wezterm")

local colors = require("01-assets")
local decorations = require("02-window")
local keymaps = require("03-keys")
local tabs = require("04-tabs")

local overrides = {
	decorations,
	--colors,
	keymaps,
	tabs,
}

local mux = wezterm.mux
-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Heetch Dark (base16)"
-- favorites:
-- Heetch Dark (base16)
-- Firewatch
-- wilmersdorf
-- rose-pine
-- This is where you actually apply your config choices

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
	tab:set_title("Kali")
	local pane1 = pane:split({ size = 0.5, cwd = "/home/kali/HTB" })
	pane1:split({ direction = "Bottom", cwd = "/home/kali/hackingVPNs" })
	local tab2 = window:spawn_tab({ cwd = "/home/kali/HTB" })
	tab2:set_title("Victim")
	tab:activate()
end)

-- tab title mo to have zoom icon

wezterm.on("format-tab-title", function(tab)
	local index = tab.tab_index + 1
	local title = tab.title
	local zoom_icon = ""

	if tab.is_active and tab.active_pane.is_zoomed then
		zoom_icon = "() "
	end

	local formatted_title = string.format(" %s%d: %s ", zoom_icon, index, title)

	return {

		{ Text = formatted_title },
	}
end)

-- font settings

config.font = wezterm.font("Iosevka Nerd Font Mono")
config.line_height = 1.2
config.font_size = 19

--Scrollback
config.scrollback_lines = 10000

-- Hyperlink Function--
local function is_shell(foreground_process_name)
	local shell_names = { "bash", "zsh", "fish", "sh", "ksh", "dash" }
	local process = string.match(foreground_process_name, "[^/\\]+$") or foreground_process_name
	for _, shell in ipairs(shell_names) do
		if process == shell then
			return true
		end
	end
	return false
end

wezterm.on("open-uri", function(window, pane, uri)
	local editor = "nvim"

	if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
		-- We're processing an hyperlink and the uri format should be: file://[HOSTNAME]/PATH[#linenr]
		-- Also the pane is not in an alternate screen (an editor, less, etc)
		local url = wezterm.url.parse(uri)
		if is_shell(pane:get_foreground_process_name()) then
			-- A shell has been detected. Wezterm can check the file type directly
			-- figure out what kind of file we're dealing with
			local success, stdout, _ = wezterm.run_child_process({
				"file",
				"--brief",
				"--mime-type",
				url.file_path,
			})
			if success then
				if stdout:find("directory") then
					pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
					pane:send_text(wezterm.shell_join_args({
						"ls",
						"-a",
						"--group-directories-first",
					}) .. "\r")
					return false
				end

				if stdout:find("text") then
					if url.fragment then
						pane:send_text(wezterm.shell_join_args({
							editor,
							"+" .. url.fragment,
							url.file_path,
						}) .. "\r")
					else
						pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
					end
					return false
				end
			end
		else
			-- No shell detected, we're probably connected with SSH, use fallback command
			local edit_cmd = url.fragment and editor .. " +" .. url.fragment .. ' "$_f"' or editor .. ' "$_f"'
			local cmd = '_f="'
				.. url.file_path
				.. '"; { test -d "$_f" && { cd "$_f" ; ls -a -p --hyperlink --group-directories-first; }; } '
				.. '|| { test "$(file --brief --mime-type "$_f" | cut -d/ -f1 || true)" = "text" && '
				.. edit_cmd
				.. "; }; echo"
			pane:send_text(cmd .. "\r")
			return false
		end
	end

	-- without a return value, we allow default actions
end)

for _, override_item in pairs(overrides) do
	for key, value in pairs(override_item) do
		config[key] = value
	end
end

-- and finally, return the configuration to wezterm
return config
