return {
	"romgrk/barbar.nvim",
	lazy = false,
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	opts = {
		focus_on_close = "left",
		highlight_visible = true,
		highlight_inactive = true,
		icons = {
			separator_at_end = false,
			filetype = {
				custom_colors = false,
				enabled = true,
			},
		},
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- navigate buffers
		keymap("n", "<S-j>", "<cmd>BufferPrevious<CR>", opts)
		keymap("n", "<S-k>", "<cmd>BufferNext<CR>", opts)

		-- reorder buffers
		keymap("n", "<M-J", "<cmd>BufferMovePrevious<cr>", opts)
		keymap("n", "<M-K", "<cmd>BufferMoveNext<cr>", opts)

		-- close buffer
		keymap("n", "<C-x>", "<cmd>BufferClose<cr>", opts)
		keymap("n", "<C-q>", "<cmd>q<cr>", opts)
	end,
}
