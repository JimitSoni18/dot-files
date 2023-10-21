local wezterm = require 'wezterm'
local config = {}
config.font = wezterm.font 'JetBrains Mono'

config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

config.color_scheme = 'Bespin (base16)'

return config
