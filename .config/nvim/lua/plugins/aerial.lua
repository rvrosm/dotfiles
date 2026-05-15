return {
    {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },

  opts = {

      on_attach = function(bufnr)
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },

    keys = {
      { "<leader>2", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },

  },

}
