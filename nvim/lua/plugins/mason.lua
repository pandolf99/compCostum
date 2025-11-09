-- Language server protocol configuration
-- config for lsp
-- To instal new servers: 
-- add to ensure_installed
-- And then setup in lsp-config
return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {"pyright", "gopls", "denols"}
		},
	},
	{ 
		"neovim/nvim-lspconfig",
		config = function () 
			 vim.diagnostic.config({
				virtual_text = true,
			})
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
					  buildFlags = {
						"-tags=unit,integration,payloads",
					  },
					},
				},
			})
		-- add specific language server config here 
		-- defaults are usually okay.
		end,
	},
}
