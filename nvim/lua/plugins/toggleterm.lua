return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    toggleterm = require("toggleterm")

    toggleterm.setup({
      direction = "float",
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("toggleterm.terminal").Terminal:new({
        direction = "float",
        dir = vim.fn.getcwd(),
      }):toggle()
    end, { desc = "Toggle terminal into current working directory "})
  end,
}
