-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Monokai Pro Ristretto (Gogh)"
config.window_background_opacity = 0.2

-- and finally, return the configuration to wezterm
return config
