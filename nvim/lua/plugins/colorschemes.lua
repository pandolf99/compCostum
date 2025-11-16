return {
	{
		"arcticicestudio/nord-vim",
		name = "nord",
		lazy = false,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
		keys = {
			{
				"<leader>cn",
				function()
					vim.cmd([[colorscheme nord]])
				end,
				desc = "Colorscheme Nord",
			},
		},
	},
}
