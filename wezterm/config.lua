local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--
-- COLOR SCHEME
--
config.color_scheme = 'nightfox'
config.term = 'wezterm'
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
-- config.font = wezterm.font('Monaspace Radon Var', { weight = 'Black' })
-- config.harfbuzz_features = { 'calt', 'clig', 'liga', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09' }
config.font_size = 18.0
config.line_height = 1.2;
config.dpi = 72.0

-- ligs (github monaspace): https://github.com/githubnext/monaspace?tab=readme-ov-file#coding-ligatures
-- ss01: == === !==
-- ss02: <= >=
-- ss03: -> ~>
-- ss04: </ />
-- ss05: |>
-- ss06: ###, +++, &&&
-- ss07: :: =:=
-- ss08: ..=, .-, .=
-- ss09: <=>, >>, <<, =<<


--
-- TAB
--
config.enable_tab_bar = false
-- config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true

--
-- WINDOW
--
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_background_opacity = 0.95

---
--- ALLOW HYPERLINKS
---
config.hyperlink_rules = wezterm.default_hyperlink_rules()

return config
