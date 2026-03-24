return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1

		-- Keybinds
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "dbui" },
			callback = function()
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(0, "n", "<leader>d", ":DBUIToggle<CR>", opts)
			end,
		})

		-- Custom helpers
		vim.g.db_ui_table_helpers = {
			postgresql = {
				Columns = "select column_name as attribute, data_type, is_nullable, column_default as default, character_maximum_length as charmax, is_generated, is_updatable from information_schema.columns where table_name='{table}' and table_schema='public' order by ordinal_position",
			},
		}
	end,
}
