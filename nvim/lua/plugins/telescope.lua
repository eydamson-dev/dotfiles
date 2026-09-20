return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require('telescope')

    -- Shorten function name
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    keymap("n", "<C-o>", ":Telescope find_files<cr>", opts)
    keymap("n", "<C-f>", ":Telescope live_grep<cr>", opts)
    keymap("n", "<C-b>", ":Telescope buffers<cr>", opts)
    keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
    keymap("n", "<leader>p", ":Telescope projects<cr>", opts)


    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        file_ignore_patterns = { "node_modules", "documentation", "jQuery", "handlebars", "youtube-embed", "fonts" },
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        -- Disable treesitter previewer highlighter to avoid ft_to_lang error
        preview = {
          treesitter = false,
        },

        layout_config = {
          width = 0.95,
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
    }
  end
}
