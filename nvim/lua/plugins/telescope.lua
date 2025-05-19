
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
	keys = {
        {
            "<Leader>ff",
            "<cmd>Telescope find_files<CR>",
            desc = "Find files",
        },
        {
            "<Leader>fg",
            "<cmd>Telescope live_grep<CR>",
            desc = "ripgrep through files",
        },
        {
            "<Leader>fs",
            "<cmd>Telescope grep_string<CR>",
            desc = "ripgrep through files",
        },
        {
            "<Leader>fb",
            "<cmd>Telescope buffers<CR>",
            desc = "find buffer",
        },
      },
	cmd = "Telescope"
	}
