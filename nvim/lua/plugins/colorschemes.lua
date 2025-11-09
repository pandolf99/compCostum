return {
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		lazy = false,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
}
