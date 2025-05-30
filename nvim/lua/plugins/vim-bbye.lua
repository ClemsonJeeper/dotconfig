return {
  "moll/vim-bbye",
  config = function()
    vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>", { desc = "Close current buffer"} )
  end,
}
