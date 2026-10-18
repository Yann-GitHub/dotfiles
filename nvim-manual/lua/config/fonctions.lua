
local fenetre_info = nil

local function obtenir_infos()
	local buffer = vim.api.nvim_get_current_buf()
	local nom = vim.api.nvim_buf_get_name(buffer)
	local lignes = vim.api.nvim_buf_line_count(buffer)

	return {
		buffer = buffer,
		nom = nom,
		lignes = lignes,
	}
end


local function fermer_infos()
	if fenetre_info ~= nil then
		vim.api.nvim_win_close(fenetre_info, true)
		fenetre_info = nil
	end
end

local function afficher_infos()
	if fenetre_info ~= nil then
		return
	end

	-- local buffer = vim.api.nvim_get_current_buf()
	-- local nom = vim.api.nvim_buf_get_name(buffer)
	-- local lignes = vim.api.nvim_buf_line_count(buffer)
	
	local infos = obtenir_infos()


	-- print("Buffer : " .. buffer)
	-- print("Fichier : " .. nom)
	-- print("Lignes : " .. lignes)
	
	local buffer_info = vim.api.nvim_create_buf(false, true)
	
	local contenu = {
	   "Informations",
	   "",
	   "Buffer : " .. infos.buffer,
	   "Fichier : " .. infos.nom,
	   "Lignes : " .. infos.lignes,
	}

	vim.api.nvim_buf_set_lines(
	  buffer_info,
	  0,
	  -1,
	  false,
	  contenu
	)

	fenetre_info = vim.api.nvim_open_win(buffer_info, true, {
	  relative = "editor",
	  width = 60,
	  height = 7,
	  row = 5,
	  col = 10,
	  border = "rounded"
	})

	vim.keymap.set("n", "<Esc>", fermer_infos, {
		buffer = buffer_info,
	})
end

return {
	afficher_infos = afficher_infos
}
