return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope-ui-select.nvim" },
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					-- even more opts
				}),
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("ui-select")
	end,
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "find files",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "ripgrep through files",
		},
		{
			"<leader>fs",
			"<cmd>Telescope grep_string<cr>",
			desc = "Find instances of string",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "find buffer",
		},
		{
			"<leader>fr",
			"<cmd>Telescope lsp_references<cr>",
			desc = "find references",
		},
	},
	cmd = "Telescope",
}
