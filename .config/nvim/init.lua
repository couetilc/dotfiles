vim.g.mapleader = ' ' -- must be before requiring lazy
vim.opt.autoindent = true

vim.g.loaded_netrw = 1 -- disable netrw for nvim-tree
vim.g.loaded_netrwPlugin = 1 -- disable netrw for nvim-tree

-- bootstrap lazy.nvim (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- initialize lazy.nvim
require("lazy").setup("plugins", {})
