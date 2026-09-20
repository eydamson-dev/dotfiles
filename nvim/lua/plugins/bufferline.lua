return {
  enabled = false,
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				indicator = {
					icon = "▎",
					style = "icon",
				},
			},
		})
	end,
}
