return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "ipynb" },
	opts = {
		overrides = {
			filetype = {
				ipynb = {
					-- Keep the cursor line rendered in the notebook facade.
					anti_conceal = { enabled = false },
				},
			},
		},
	},
}
