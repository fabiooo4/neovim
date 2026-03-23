return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
  opts = {
    -- Remove transparent mode if running neovide
    transparent_background = not vim.g.neovide
  }
}
