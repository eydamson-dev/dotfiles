return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		provider = "gemini",
		auto_suggestions_provider = "gemini",
		-- Configure the Gemini provider
		providers = {
			gemini = {
				-- You can specify the model you want to use
				-- Check Google's documentation for the latest models.
				-- e.g., 'gemini-1.5-pro-latest' or 'gemini-1.5-flash-latest'
        model = "gemini-2.5-flash-latest",

				-- Optional: Set other parameters if needed
				temperature = 0.5,
				max_tokens = 4096,
			},
		},
		behavior = {
			auto_suggestions = true,
			auto_suggestions_delay = 1000,
			auto_suggestions_max_length = 100,
		},
		hints = {
			enabled = true,
		},
		-- system_prompt as function ensures LLM always has latest MCP server state
		-- This is evaluated for every message, even in existing chats
		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub and hub:get_active_servers_prompt() or ""
		end,
		-- Using function prevents requiring mcphub before it's loaded
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,
		disabled_tools = {
			"list_files", -- Built-in file operations
			"search_files",
			"read_file",
			"create_file",
			"rename_file",
			"delete_file",
			"create_dir",
			"rename_dir",
			"delete_dir",
			"bash", -- Built-in terminal access
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"ravitemer/mcphub.nvim",
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
