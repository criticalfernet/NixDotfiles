local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = wezterm.config_builder()


config.initial_cols = 300
config.initial_rows = 100

config.color_scheme = 'GruvboxDark'
--config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.99
config.font_size = 16

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

config.enable_tab_bar = true
--config.hide_tab_bar_if_only_one_tab = true
--config.tab_bar_at_bottom = true
config.tab_and_split_indices_are_zero_based = false
config.window_decorations = "NONE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

tabline.setup({
	options = {
		theme = 'GruvboxDark',
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
	},
	sections = {
		tabline_b = {},
		tabline_x = {},
		tabline_y = {},
		tabline_z = { {'workspace',icons_enabled = false} }
	}
})

--tabline.set_theme('GruvboxDark')
tabline.apply_to_config(config)

return config
