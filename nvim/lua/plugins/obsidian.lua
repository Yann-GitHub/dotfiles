return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    opts = {
      legacy_commands = false,

      note_id_func = function(title)
        return title
      end,

      workspaces = {
        {
          name = "testVault",
          path = vim.fn.expand("~/homelab/ObsidianTest"),
        },
      },
    },
  },
}
