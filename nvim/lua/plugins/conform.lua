-- Format on save using conform.nvim
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				return not vim.g.disable_autoformat
			end,
			formatters_by_ft = {
				python = { "isort", "black", "autoflake" },
				javascript = { "prettier" },
			},
			formatters = {
				autoflake = {
							command = "autoflake",
							args = {
								"--remove-all-unused-imports",
								"--remove-unused-variables",
								"--in-place", 
								"--ignore-pass-after-docstring",
						"$FILENAME",
					},
					stdin = false,
				},
			},
	},
}
