return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = false,
  opts = {
    scope = { enabled = false },
    indent = {
      highlight = { "NonText" },
    },
    whitespace = {
      highlight = { "NonText" },
      remove_blankline_trail = false,
    },
  },
}
