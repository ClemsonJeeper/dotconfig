return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = false,
      mail = false
    }
  end
}
