return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        { "nvim-telescope/telescope.nvim", },
        { "kkharji/sqlite.lua", module = "sqlite" },
    },
    config = function()
        require("neoclip").setup({
            history = 1000,
            enable_persistent_history = true,
        })

        vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
    end,
}
