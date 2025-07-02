return {
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    name = "colorizer",
    config = function()
			require'colorizer'.setup()
    end
  }
}
