local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Lua Line

  -- Treesitter

  -- Git

  -- Terminal UI
  -- use "akinsho/toggleterm.nvim"

  -- Project management
  -- 'goolord/alpha-nvim',

  -- use "airblade/vim-rooter"
  -- {
  --   'mattn/emmet-vim',
  -- },
  -- {
  --   'dcampos/cmp-emmet-vim'
  -- },

  -- {
  --   'wuelnerdotexe/vim-astro',
  --   config = function()
  --     vim.g.astro_typescript = 'enable'
  --     vim.g.astro_stylus = 'enable'
  --   end
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
})
