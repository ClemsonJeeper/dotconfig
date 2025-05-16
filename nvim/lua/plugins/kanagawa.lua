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
	vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#54546d", bg = "#000000"})
    end
}
