return {
  {
	"nvim-telescope/telescope.nvim",

	cmd = "Telescope",

	dependencies = {
	  "nvim-lua/plenary.nvim",
	},

	keys = {
	  {
	     "<leader>ff",
	     "<cmd>Telescope find_files<cr>",
	     desc = "Find Files",
	  },
	  {
	     "<leader>fg",
	     "<cmd>Telescope live_grep<cr>",
	     desc = "Live Grep",
	  },
	  {
	     "<leader>fb",
	     "<cmd>Telescope buffers<cr>",
	     desc = "Buffers",
	  },
	},
	opts = {
	  defaults = {
	    prompt_prefix = "> ",

	    mappings = {
          	i = {
            	  ["<C-b>"] = require("telescope.actions").send_selected_to_qflist
              	    + require("telescope.actions").open_qflist,
          	},
          	n = {
            	  ["<C-b>"] = require("telescope.actions").send_selected_to_qflist
              	    + require("telescope.actions").open_qflist,
          	},
            },
	  },
	  pickers = {
	    find_files = {
		hidden = true,
	    },
	    live_grep = {
		additional_args = function()
		  return { "--hidden" }
		end,
	    },
	  },
	},
  },
}
