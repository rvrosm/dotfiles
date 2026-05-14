return {
  {
    "akinsho/toggleterm.nvim",

    opts = {
      size = 20,
      open_mapping = [[<C-\>]],

      -- ✅ floating terminal
      direction = "float",

      -- ✅ enter insert mode automatically
      start_in_insert = true,

      -- ✅ nicer floating window
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      },
    },

keys = {

  { "<leader>te", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
  { "<leader>t1", "<cmd>ToggleTerm 1<CR>", desc = "Terminal 1" },
  { "<leader>t2", "<cmd>ToggleTerm 2<CR>", desc = "Terminal 2" },
  { "<leader>t3", "<cmd>ToggleTerm 3<CR>", desc = "Terminal 3" },
},


    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- ✅ terminal keymaps
      local function set_terminal_keymaps()
        local opts = { buffer = 0 }

        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      end

      -- ✅ apply only to toggleterm terminals
      vim.api.nvim_create_autocmd("TermOpen", {

        pattern = "term://*toggleterm#*",
        callback = set_terminal_keymaps,
      })
    end,
  },
}
