local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--
-- COLOR SCHEME
--
config.color_scheme = 'catppuccin-mocha'
-- config.term = 'wezterm'
-- This increases color saturation by 50%
-- config.foreground_text_hsb = {
--   hue = 0.98,
--   saturation = 1.1,
--   brightness = 1.3,
-- }

--
-- FONT
--
config.font = wezterm.font('Gintronic Nerd Font', { weight = 'Medium' })
-- config.harfbuzz_features = { 'calt', 'clig', 'liga', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09' }
config.font_size = 34.0
config.line_height = 1.2;
config.dpi = 72.0

--
-- TAB
--
config.enable_tab_bar = false

--
-- WINDOW
--
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

config.send_composed_key_when_left_alt_is_pressed = true

return config
