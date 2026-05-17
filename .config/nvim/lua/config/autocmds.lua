vim.api.nvim_create_autocmd("FileType", {
  pattern = "beancount",
  callback = function()
    vim.opt_local.foldlevel = 0
  end,
})
