return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 30,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local mapkey = require("util.keymapper").mapvimkey

    mapkey("<leader>ee", "NvimTreeToggle<CR>", "n", { desc = "Toggle file explorer" }) -- toggle file explorer
    mapkey("<leader>ef", "NvimTreeFindFileToggle<CR>", "n", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    mapkey("<leader>ec", "NvimTreeCollapse<CR>", "n", { desc = "Collapse file explorer" }) -- collapse file explorer
    mapkey("<leader>er", "NvimTreeRefresh<CR>", "n", { desc = "Refresh file explorer" }) -- refresh file explorer
    mapkey("<F8>", "NvimTreeToggle", "n", { desc = "Toggle file explorer" })
  end
}
