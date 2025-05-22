return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    indent = { enabled = false },
    input = { enabled = true },
    picker = {
      enabled = true,
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Open file explorer" },
    { "<F6>", function()
      if Snacks.indent.enabled then
        Snacks.indent.disable()
        vim.cmd("set nolist")
      else
        Snacks.indent.enable()
        vim.cmd("set list")
      end
    end, desc = "Toggle indent guides and tab markers" },
  }
}
