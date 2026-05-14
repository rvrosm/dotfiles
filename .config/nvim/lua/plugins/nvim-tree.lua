return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons
    },

    opts = {
      view = {
        width = 25,
      },
      renderer = {
        group_empty = true,
      },
      filters = {

        dotfiles = false,
      },
    },

    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },

    },
  },
}
