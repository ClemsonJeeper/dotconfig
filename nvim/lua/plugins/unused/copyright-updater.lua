return {
  "LittleMorph/copyright-updater.nvim",
  config = function()
    require("copyright-updater").setup({
      return_cursor = true,
      style = {
        kind = "simple",
        simple = {
          force = true,
        }
      },
      limiters = {
        post_pattern = "Juniper.*",
      }
    })
  end,
}
