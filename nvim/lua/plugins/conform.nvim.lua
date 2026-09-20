return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
			},
		})

		local conform = require("conform")
		local wk = require("which-key")
		wk.add({
			"<leader>lf",
			function()
				conform.format({
					lsp_format = "fallback",
					async = true,
					timeout_ms = 500,
				})
			end,
			desc = "Format",
		})
	end,
}
