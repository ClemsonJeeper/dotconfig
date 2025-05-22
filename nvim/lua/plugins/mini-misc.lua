return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    mini_misc = require("mini.misc")
    mini_misc.setup({})

    vim.keymap.set("n", "<Leader>wz", mini_misc.zoom, { desc = "Zoom into a floating window" })
  end,
}
