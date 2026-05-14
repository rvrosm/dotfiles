return {
  {
    "neovim/nvim-lspconfig", -- still needed for server configs
    config = function()

    -- lua
      -- configure server
      vim.lsp.config["lua_ls"] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
      -- enable server
      vim.lsp.enable("lua_ls")
    end,
  },
}
