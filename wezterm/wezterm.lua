local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = "wezterm" -- https://wezfurlong.org/wezterm/config/lua/config/term.html
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("JetBrains Mono", { weight = "Medium", italic = false })
config.font_size = 16.0
config.enable_tab_bar = false
config.macos_window_background_blur = 30
config.window_background_opacity = 1.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.mouse_bindings = {
	-- Ctrl-click will open link under mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
