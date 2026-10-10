return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"rust",
			"c",
			"javascript",
			"lua",
			"java",
			"gitcommit",
			"git_rebase",
			"diff",
			"python",
			"markdown",
			"markdown_inline",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match) or ev.match

				-- Only query nvim-treesitter registry for auto-installing upstream parsers
				local available_langs = require("nvim-treesitter").get_available()
				if vim.tbl_contains(available_langs, lang) then
					local installed_langs = require("nvim-treesitter").get_installed()
					if not vim.tbl_contains(installed_langs, lang) then
						require("nvim-treesitter").install(lang):wait()
					end
				end

				-- Start highlighting for all filetypes with a valid parser
				pcall(vim.treesitter.start, ev.buf)

				-- Folds
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"

				-- Indentation
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
