return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>",
			mode = { "n", "v" },
		},
	},
	opts = {
		preset = "modern",
		plugins = {
			marks = true, -- Shows a list of your marks on ' and `
			registers = true, -- Shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- Show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- Number of spelling suggestions to show
			},
			presets = {
				operators = false, -- Adds help for operators like d, y, ...
				motions = false, -- Adds help for motions
				text_objects = false, -- Help for text objects after entering an operator
				windows = true, -- Default bindings on <c-w>
				nav = true, -- Misc bindings to work with windows
				z = true, -- Bindings for folds, spelling, etc., prefixed with z
				g = true, -- Bindings prefixed with g
			},
		},
		icons = {
			breadcrumb = "»", -- Symbol for active key combo in the command line
			separator = "➜", -- Symbol between a key and its label
			group = "+", -- Symbol prepended to a group
		},
		win = {
			border = "rounded", -- Window border style
			wo = {
				winblend = 5,
			},
		},
	},
}
