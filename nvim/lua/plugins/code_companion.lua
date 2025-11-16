return {
	{
		"olimorris/codecompanion.nvim",
		cmd = "CodeCompanion",
		-- dev = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion chat" },
			{ "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion chat", mode = "x" },
		},
		opts = {
			strategies = {
				inline = {
					keymaps = {
						accept_change = {
							modes = { n = "<leader>cy" },
							description = "Accept the suggested change",
						},
						always_accept = {
							modes = { n = "<leader>cY" },
							description = "Accept and enable auto mode",
						},
						reject_change = {
							modes = { n = "<leader>cn" },
							description = "Reject the suggested change",
						},
					},
				},
				chat = {
					keymaps = {
						clear = {
							modes = { n = "<C-l>" },
							description = "Clear chat",
						},
					},
				},
			},
		},
	},
}
