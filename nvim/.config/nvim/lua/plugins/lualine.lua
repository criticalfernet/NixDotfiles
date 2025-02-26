return {
  {
    "nvim-lualine/lualine.nvim",
		dependencies = {'nvim-tree/nvim-web-devicons'},
    lazy = false,
    name = "lualine",
    config = function()
			require('lualine').setup({
				options={theme='material'}
			})
    end
  }
}
