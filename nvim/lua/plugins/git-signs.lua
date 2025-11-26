local function if_in_diff_mode(action, fallback)
	if vim.api.nvim_get_option_value("diff", { win = 0 }) then
		action()
	end
	return fallback
end

local function apply_arg(action, arg)
	return function()
		action(arg)
	end
end

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			vim.keymap.set("n", "gs", function()
				if_in_diff_mode(gitsigns.stage_hunk, "cs")
			end, { buffer = bufnr, desc = "Stage Hunk in diff mode" })
			vim.keymap.set("n", "gr", function()
				if_in_diff_mode(gitsigns.reset_hunk, "cr")
			end, { buffer = bufnr, desc = "Reset Hunk in diff mode" })
			vim.keymap.set("n", "]c", gitsigns.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
			vim.keymap.set("n", "[c", gitsigns.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })
			vim.keymap.set("n", "<leader>d", gitsigns.diffthis, { buffer = bufnr, desc = "Diff this" })
			vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { buffer = bufnr, desc = "Blame line" })
			vim.api.nvim_create_user_command(
				"DiffMain",
				apply_arg(gitsigns.diffthis, "main"),
				{ desc = "Diff this with main" }
			)
			vim.api.nvim_create_user_command("StageBuff", gitsigns.stage_buffer, { desc = "Stage Buffer" })
			vim.api.nvim_create_user_command("ResetBuff", gitsigns.reset_buffer, { desc = "Reset Buffer" })
		end,
	},
}
