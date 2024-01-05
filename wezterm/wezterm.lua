local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Macchiato'
config.font_size = 16.0
config.enable_tab_bar = false
config.macos_window_background_blur = 30
config.window_background_opacity = 1.0


return config
