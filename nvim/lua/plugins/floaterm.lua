return {
	"voldikss/vim-floaterm",
	config = function()
		vim.g.floaterm_autoinsert = 1
		vim.g.floaterm_width = 0.9
		vim.g.floaterm_height = 0.9
		vim.g.floaterm_wintitle = 1
		vim.g.floaterm_autoclose = 1

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

    keymap('n', "<C-g>", "<cmd>FloatermNew lazygit<cr>")

		local function toggleTerminal(term_name)
			local exist = vim.fn["floaterm#terminal#get_bufnr"](term_name)
			if exist == -1 then
				vim.cmd("FloatermNew --name=" .. term_name)
			else
				vim.cmd("FloatermToggle " .. term_name)
			end
		end

		for i = 1, 9 do
			local term_name = "terminal_" .. i
			keymap("n", "<leader>" .. i, function()
				toggleTerminal(term_name)
			end, opts)

      -- to toggle when in terminal
			keymap("t", "<leader>" .. i, "<C-\\><C-n>:FloatermToggle " .. term_name .. "<CR>", opts)
		end
	end,
}
