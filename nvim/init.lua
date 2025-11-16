-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 0
vim.opt.encoding = "utf-8"

-- default indent settings
-- overwrite in ft plugin or in after
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Better window movement
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true, nowait = true })

-- Restore cursor when exiting vim
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
	command = "set guicursor=a:ver25-blinkon0",
})

vim.api.nvim_create_autocmd("VimEnter", {
	command = "clearjumps",
})

-- Lazy plugin manager
-- might overwrite some settings
require("config.lazy")
