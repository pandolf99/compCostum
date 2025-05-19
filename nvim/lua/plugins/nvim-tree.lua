return {
	"nvim-tree/nvim-tree.lua",
	opts =  {
		hijack_netrw = true,
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = { 
		{ 
		"<Leader>t", 
		"<cmd>NvimTreeFindFileToggle<CR>",
		desc = "Toggle NvimTree" ,
		},
	},
}
