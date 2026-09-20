return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    -- UFO folding settings
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need a large value, feel free to decrease the value
    vim.opt.fillchars = {
      fold = " ",
      foldopen = "▼",
      foldsep = " ",
      foldclose = "▶",
    }

    local ftMap = {
      vim = "indent",
      python = { "indent" },
      git = "",
    }

    local ufo = require("ufo")
    ufo.setup({
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
        json = { "array" },
        c = { "comment", "region" },
      },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
      provider_selector = function(bufnr, filetype, buftype)
        -- if you prefer treesitter provider rather than lsp,
        return ftMap[filetype] or { "treesitter", "indent" }
      end,
    })

    -- Keymaps
    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except kinds" })
    vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds with" }) -- closeAllFolds == closeFoldsWith(0)
    vim.keymap.set("n", "L", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold or LSP hover" })
  end,
}
