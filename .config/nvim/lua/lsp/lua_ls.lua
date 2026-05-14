return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.stdpath("config") .. "/lua",
        },
      },
    },
  },
}
