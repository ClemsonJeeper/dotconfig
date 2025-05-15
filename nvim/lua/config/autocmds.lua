vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  command = "IBLDisable",
})
