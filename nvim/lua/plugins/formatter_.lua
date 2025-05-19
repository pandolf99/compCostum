--formatters
--make sure to first install using mason

--Format on save
augroup = vim.api.nvim_create_augroup
autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

--For some reason need to call config directly and call setup here
--instead of simply defining the opts, the usual lazy way
return {
	"mhartington/formatter.nvim",
	config = function(_)
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.ERROR,
			filetype = {
				python = {
					--sort imports
					require("formatter.filetypes.python").isort,
					require("formatter.filetypes.python").black
				}
			}
		})
	end,
}
