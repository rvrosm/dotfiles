return {
  {
    "smjonas/snippet-converter.nvim",

    config = function()
      local template = {
        sources = {

          ultisnips = {
            vim.fn.stdpath("config") .. "/UltiSnips",
          },
        },
        output = {
          vscode_luasnip = {
            vim.fn.stdpath("config") .. "/luasnippets",
          },
        },
      }

      require("snippet_converter").setup({
        templates = { template },
      })
    end,
  },
}

