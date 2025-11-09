return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
	},
	keys = {
		vim.keymap.set("n", "<leader>cc", "<Cmd>CopilotChatToggle<CR>"),
	},
	cmd = { "CopilotChatOpen", "CopilotChatToggle" },
}
