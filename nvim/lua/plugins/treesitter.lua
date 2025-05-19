#syntax highlighting plugin
return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
	config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "python", "bash", "go" },
          sync_install = false,
		  auto_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
