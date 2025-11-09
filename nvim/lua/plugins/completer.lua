-- lua/plugins/cmp.lua

return {
	-- Main nvim-cmp plugin
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- Load cmp on InsertEnter
		dependencies = {
			-- Completion sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip", -- snippet completions (if you use LuaSnip)
			"hrsh7th/cmp-nvim-lsp", -- LSP completions

			-- Snippet engine
			"L3MON4D3/LuaSnip", -- LuaSnip snippet engine
			-- "rafamadriz/friendly-snippets", -- Optional: A bunch of snippets to use

			-- LSP Configuration
			-- "neovim/nvim-lspconfig", -- Required for LSP completions

			-- LSP kind
			"onsails/lspkind.nvim", -- This was missing!
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}),
				{
					{ name = "buffer" },
				},
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind =
							string.format("%s %s", require("lspkind").presets.default[vim_item.kind], vim_item.kind)
						return vim_item
					end,
				},
			})
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}),
				{
					{ name = "cmdline" },
				},
			})
		end,
	},
}
