return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      vim.lsp.config["beancount"] = require("lsp.beancount")
      vim.lsp.config["lua_ls"] = require("lsp.lua_ls")
    end,
  },
}
