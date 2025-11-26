local colorTable = {
	-- This one is not as good as shaunsingh/nord.nvim
	-- keep is disabled for now
	{
		"arcticicestudio/nord-vim",
		name = "nord",
		disabled = true,
		lazy = true,
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		lazy = true,
		default = false,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		opts = {
			background = {
				dark = "wave",
				light = "lotus",
			},
		},
		lazy = true,
		default = true,
	},
}
-- Easily switch between defaults
for _, color in ipairs(colorTable) do
	if color.default then
		color.lazy = false
		color.priority = 1000
		color.config = function()
			require(color.name).setup(color.opts or {})
			vim.cmd(string.format("colorscheme %s", color.name))
		end
	end
end
return colorTable
