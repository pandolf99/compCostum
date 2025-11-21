-- Add LSPs here
-- Make sure they are generally available in the path
return {
	"neovim/nvim-lspconfig",
	-- This is a bit different than other plugins.
	-- We call this so that lsps are configured correctly
	-- on nvim startup, and there is no "require" for lsp
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
			signs = false,
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
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.enable("gopls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("lua_ls")
	end,
}
