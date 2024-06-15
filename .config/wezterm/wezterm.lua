local wezterm = require 'wezterm'

local config = {
  use_ime = true,
  send_composed_key_when_left_alt_is_pressed = true,
  hide_tab_bar_if_only_one_tab = true,

  font_size = 15,
  color_scheme = 'GitHub Dark',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  },
}

return config
