vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	command = "setlocal shiftwidth=2 tabstop=2"
})
