return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		name = "lualine",
		config = function()
			vim.opt.showtabline = 0
			require('lualine').setup({
				options = {
					theme = 'moonfly',
					component_separators = { left = ' ', right = '' },
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = {},
					lualine_c = {{
						'tabs',
						mode = 1
					}},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { 'branch', 'diff' }
				},
			})
		end
	}
}
