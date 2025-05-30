return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    wk = require("which-key")

    wk.setup({
      preset = "helix",
    })

    wk.add({
      { "<leader>d", group = "Debugging" },
      { "<leader>f", group = "Fuzzy Find" },
      { "<leader>s", group = "Split Screen" },
      { "<leader>t", group = "Tabs" },
    })

    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
}
