local fonctions = require("config.fonctions")


vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("write")
end)

local function afficher_fichier()
	local fichier = vim.fn.expand("%:t")
	print("Fichier : " .. fichier)
end

vim.keymap.set("n", "<leader>f", afficher_fichier)

local function afficher_ligne()
	local ligne = vim.api.nvim_get_current_line()
	print("Ligne : " .. ligne)
end

vim.keymap.set("n", "<leader>l", afficher_ligne)

-- Normal mapping
-- vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
-- vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- With Lua API
vim.keymap.set("n", "<leader>bn", function()
vim.cmd("bnext")
end)

vim.keymap.set("n", "<leader>bp", function()
vim.cmd("bprev")
end)

local function ouvrir_fenetre()
	local buffer = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, {
		"Bonjour depuis Neovim !",
		"",
		"Ceci est une fenêtre flottante.",

	})

	local fenetre = vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		width = 40,
		height = 5,
		row = 5,
		col = 10,
		border = "rounded",
	})
end


vim.keymap.set("n", "<leader>o", ouvrir_fenetre)
vim.keymap.set("n", "<leader>i", fonctions.afficher_infos)
-- vim.keymap.set("n", "<leader>c", fermer_infos)

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })


-- Gitsigns 
vim.keymap.set("n", "]c", function()
  require("gitsigns").next_hunk()
end, { desc = "Git: prochain changement" })

vim.keymap.set("n", "[c", function()
  require("gitsigns").prev_hunk()
end, { desc = "Git: changement précédent" })
