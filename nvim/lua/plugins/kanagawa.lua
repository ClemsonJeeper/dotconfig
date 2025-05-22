return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      transparent = true,
    })
    vim.cmd("colorscheme kanagawa")
    vim.api.nvim_set_hl(0, "MatchParen", { bg = "#1207e6" })
    vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#54546d", bg = "#000000" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#6a9589", bg = "#000000" })

    -- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c8c093", bg = "#000000" })
    -- vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#938aa9", bg = "#000000", cterm = { bold = true }, bold = true})
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#54546d", bg = "#000000" })
    -- vim.api.nvim_set_hl(0, "FloatFooter", { fg = "#54546d", bg = "#000000" })
    -- vim.api.nvim_set_hl(0, "FloatShadow", { bg = "#000000" })
    -- vim.api.nvim_set_hl(0, "FloaterBorder", { fg = "#54546d", bg = "#000000" })
  end
}
