local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "JetBrainsMono Nerd Font"


local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()
return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	color_scheme = 'rose-pine',
	colors = colors,
    window_frame = window_frame, -- needed only if using fancy tab bar

	-- Font config
	font = font_with_fallback(font_name),
	warn_about_missing_glyphs = false,
	font_size = 10,
	line_height = 1.0,
	dpi = 96.0,

	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- X11
	enable_wayland = true,

	-- Keybinds
	disable_default_key_bindings = true,
  	-- timeout_milliseconds defaults to 1000 and can be omitted
  	leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
	keys = {
		{
			key = '|',
			mods = 'LEADER|SHIFT',
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = '-',
			mods = 'LEADER',
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "LeftArrow",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "RightArrow",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "UpArrow",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "DownArrow",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		{ -- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		}, -- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	-- Padding
	window_padding = {
		left = 25,
		right = 25,
		top = 25,
		bottom = 25,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
}
