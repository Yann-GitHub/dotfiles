
return {
  {
	"nvim-treesitter/nvim-treesitter",

	--event = { "BufReadPost", "BufNewFile" },
	
	--config = function()
		--print("Treesitter vient d'être chargé !")
	--end,
	--
	lazy = false,
	build = ":TSUpdate"

  }
}
