local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- .terminfo configs
-- https://wezfurlong.org/wezterm/config/lua/config/term.html
-- https://wezfurlong.org/wezterm/faq.html?h=underline#how-do-i-enable-undercurl-curly-underlines
config.term = "wezterm"

-- font configs
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("JetBrains Mono", { weight = "Medium", italic = false })
config.font_size = 16.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- window configs
config.enable_tab_bar = false
config.macos_window_background_blur = 30
config.window_background_opacity = 1.0
config.initial_rows = 180
config.initial_cols = 180

--cursor configs
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- mouse configs
config.mouse_bindings = {
	-- Ctrl-click will open link under mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
