return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = false,

    keys = {
      {
        "<leader>on",
        "<cmd>Obsidian new_from_template<CR>",
        desc = "Nouvelle note depuis un template",
      },
    },

    opts = {
      legacy_commands = false,
      frontmatter = {
        enabled = false,
      },

      note_id_func = function(title)
        if title ~= nil and title ~= "" then
          local clean_title = title:gsub("^%s+", ""):gsub("%s+$", "")
          clean_title = clean_title:gsub("[^A-Za-z0-9 ]", "")
          clean_title = clean_title:lower():gsub("(%s?)(%S+)", function(space, word)
            return space .. word:gsub("^%l", string.upper)
          end)
          return clean_title
        else
          return os.date("%Y%m%d%H%M%S")
        end
      end,

      workspaces = {
        {
          name = "Zettelkasten",
          path = vim.fn.expand("~/Zettelkasten/"),
        },
      },

      templates = {
        folder = "Templates",
        choose_new_template = true,
        date_format = "%Y%m%d%H%M%S",
      },
    },
  },
}
