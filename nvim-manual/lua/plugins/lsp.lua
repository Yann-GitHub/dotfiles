local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  {
	"neovim/nvim-lspconfig",

	config = function()

	  vim.lsp.config("lua_ls", {
	    cmd = { "lua-language-server" },
	    filetypes = { "lua" },
	    capabilities = capabilities,
	  })
	  vim.lsp.enable("lua_ls")

	  vim.lsp.config("ts_ls", {
	    capabilities = capabilities,
	  })
	  vim.lsp.enable("ts_ls")

	  vim.lsp.config("pyright", {
	    capabilities = capabilities,
	  })
	  vim.lsp.enable("pyright")

	  vim.lsp.config("yamlls", {
	    capabilities = capabilities,
	  })
	  vim.lsp.enable("yamlls")

	  vim.lsp.config("bashls", {
	    capabilities = capabilities,
	  })
	  vim.lsp.enable("bashls")
  	end,
  },
}
