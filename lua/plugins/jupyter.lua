return {
	{
		"ajbucci/ipynb.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons", -- optional, for language icons
			"folke/snacks.nvim", -- optional, for inline images
		},
		config = function()
			require("ipynb").setup({
				keymaps = {
					-- Navigation (Notebook mode)
					next_cell = "]]", -- jump to next cell
					prev_cell = "[[", -- jump to previous cell
					-- Navigation (both Notebook mode and Cell mode)
					jump_to_cell = "<leader>kj", -- open cell picker
					-- Cell operations (Notebook mode)
					cut_cell = "dd", -- cut cell to register
					paste_cell_below = "p", -- paste cell below
					paste_cell_above = "P", -- paste cell above
					move_cell_down = "<M-j>", -- move cell down
					move_cell_up = "<M-k>", -- move cell up
					-- Cell operations (both Notebook mode and Cell mode)
					add_cell_above = "<leader>ka", -- insert cell above
					add_cell_below = "<leader>kb", -- insert cell below
					make_markdown = "<leader>km", -- convert to markdown cell
					make_code = "<leader>ky", -- convert to code cell
					make_raw = "<leader>kr", -- convert to raw cell
					fold_toggle = "<leader>kf", -- toggle cell fold
					-- Execution (both Notebook mode and Cell mode)
					execute_cell = "<C-CR>", -- execute cell, stay
					execute_and_next = "<S-CR>", -- execute cell, move to next
					execute_and_insert = "<M-CR>", -- execute cell, insert new below
					execute_all_below = "<leader>kax", -- execute current and all below
					menu_execute_cell = "<leader>kx", -- execute cell (menu, if <C-CR> conflicts)
					menu_execute_and_next = "<leader>kX", -- execute and next (menu, if <S-CR> conflicts)
					-- Output (both Notebook mode and Cell mode)
					open_output = "<leader>ko", -- open cell output in float (for copying)
					clear_output = "<leader>kc", -- clear current cell output
					clear_all_outputs = "<leader>kC", -- clear all outputs
					-- Kernel (both Notebook mode and Cell mode)
					interrupt_kernel = "<C-c>", -- interrupt execution
					kernel_interrupt = "<leader>ki", -- interrupt (menu)
					kernel_restart = "<leader>k0", -- restart kernel
					kernel_start = "<leader>ks", -- start kernel
					kernel_shutdown = "<leader>kS", -- shutdown kernel
					kernel_info = "<leader>kn", -- show kernel info
					-- Inspector (both Notebook mode and Cell mode)
					variable_inspect = "<leader>K", -- inspect variable at cursor
					cell_variables = "<leader>kv", -- show all variables in cell
					toggle_auto_hover = "<leader>kH", -- toggle auto-hover on CursorHold
					-- Note: i, a, I, A, o, O, <CR> enter Cell mode; <Esc> exits Cell mode
					-- Note: u, <C-r> perform global undo/redo across cells in both Notebook mode and Cell mode
					-- Note: <C-j>/<C-k> navigate cells while in Cell mode
					-- Note: LSP commands (go to definition, references, hover, etc.) are proxied
				},
				-- Highlight groups for various notebook elements
				highlights = {
					-- For notebook
					border = "Comment", -- Cell border
					border_hover = "Special", -- Cell border when cursor on cell
					border_active = "Number", -- Cell border when in Cell mode
					exec_count = "Number", -- Execution count [N]
					output = "Comment", -- Output text
					hint = "Comment", -- Cell action keymap hints
					-- For statusline
					output_error = "DiagnosticError",
					executing = "DiagnosticWarn", -- Executing indicator
					queued = "DiagnosticHint", -- Queued indicator
				},
				-- Cell border action keymap hints
				border_hints = {
					enabled = true, -- Show action hints on active cell border
					show_on_hover = true, -- Show hints in Notebook mode
					show_on_edit = true, -- Show hints in Cell mode
				},
				kernel = {
					auto_connect = true, -- Auto-connect to kernel on notebook open
					show_status = true, -- Show kernel status in statusline
					python_path = nil, -- Custom Python path (otherwise auto-discovered)
				},
				images = {
					enabled = true,
					cache_dir = vim.fn.stdpath("cache") .. "/ipynb.nvim",
					max_width = nil, -- nil = window width minus sign/number columns
					max_height = nil, -- nil = window height minus scrolloff minus 1
				},
				inspector = {
					-- Keymaps while in cell variable inspector float window
					close = { "q", "<Esc>" }, -- Keys to close inspector window
					inspect = { "K", "<CR>" }, -- Keys to inspect variable under cursor
					-- Auto-hover inspect configuration
					auto_hover = {
						enabled = false, -- Auto-show variable hover on CursorHold
						delay = 500, -- Milliseconds before showing hover
					},
				},
				-- Cell folding configuration
				folding = {
					hide_output = false, -- Hide output when folded (includes cell end marker in fold)
				},
				-- LSP formatting configuration -- vim.lsp.buf.format() integration
				format = {
					enabled = true, -- Wrap vim.lsp.buf.format() to work with notebooks
					-- Each cell is formatted as an individual document
					-- with some formatters adding trailing blank lines.
					-- This option control how many blank lines to keep:
					trailing_blank_lines = 0, -- # trailing blank lines to keep per cell when formatted
				},
				-- Shadow buffer location (use "workspace" if LSP needs project/module layout)
				shadow = {
					location = "temp", -- "temp" (default) or "workspace"
					dir = ".ipynb.nvim", -- subdir used when location = "workspace" (opt-in)
				},
			})
		end,
	},
}
