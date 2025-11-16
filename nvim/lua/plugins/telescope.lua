return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		extensions = {
			["ui-select"] = {},
			["fzf"] = {},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		-- Need to call extensions after calling setup
		-- opts should be set in the above table
		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
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
			desc = "find instances of string",
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
		{
			"<leader>fk",
			"<cmd>Telescope keymaps<cr>",
			desc = "find keymaps",
		},
	},
	cmd = "Telescope",
}
