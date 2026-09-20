return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
		"giuxtaposition/blink-cmp-copilot",
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<enter>"] = { "accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
			menu = {
				border = "rounded",
				draw = {
					treesitter = {
						"lsp",
					},
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
				},
			},
			ghost_text = {
				enabled = false,
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "avante", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					enabled = true,
					async = true,
				},
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
				buffer = {
					opts = {
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
