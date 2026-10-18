-- vim.api.nvim_create_autocmd("BufWritePost", {
--  callback = function()
-- 	 print("Fichier sauvegardé !")
-- end,
-- })
--

local groupe = vim.api.nvim_create_augroup("ConfigPersonnel", {
	clear = true
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = groupe,
	pattern = "*.lua",
	callback = function(args)
		print("Fichier Lua sauvegardé !")
		print("Path : " .. args.file)
end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = groupe,
	pattern = "*.txt",
	callback = function()
			print("Fichier Text sauvegardé !")
end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = groupe,
	pattern = "lua",
	callback = function(args)
		vim.opt_local.relativenumber = true
		print("Nom de fichier : " .. args.file)
end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

