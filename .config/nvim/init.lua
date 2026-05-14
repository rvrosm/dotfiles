-- Enable Lua module caching for faster startup
vim.loader.enable()


-- Set leader key early (before any mappings)
vim.g.mapleader = ','

-- Disable netrw (we use nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")
require("config.colors")
require("config.options")
require("config.keymaps")
require("config.lsp")
