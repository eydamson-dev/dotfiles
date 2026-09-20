return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
  init = function ()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
  opts = {
    transparent_background = true,
    float = {
      transparent = true
    },
    auto_integrations = true,
    integrations = {
      barbar = true,
      blink_cmp = {
        style = "rounded"
      }
    }
  }
}
