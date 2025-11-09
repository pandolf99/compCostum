-- Format on save using conform.nvim
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		-- Use default options when formatting on save
		format_on_save = true,
		formatters_by_ft = {
			python = { "isort", "black", "autoflake" },
			javascript = { "prettier" },
			lua = { "stylua" },
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
