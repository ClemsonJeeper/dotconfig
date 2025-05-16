local mapkey = require("util.keymapper").mapvimkey

mapkey("-", "<cmd>Oil --float<CR>", "n", { desc="Open Directory in Oil" })

-- Various
mapkey("<F5>", "CopilotChatToggle<CR>", "n");
mapkey("<F6>", "IBLToggle<CR>:se list!", "n")
mapkey("<leader>/", "nohlsearch", "n")

-- Whitespace
mapkey("_s", "StripWhitespace", "n")

-- Pane and Window Navigation
-- mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
-- mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
-- mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
-- mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
-- mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
-- mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
-- mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
-- mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
-- mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
-- mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
-- mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
-- mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right
--
-- -- Bind shift-arrows to navigation
-- mapkey("<S-Left>", "wincmd h", "n") -- Navigate Left
-- mapkey("<S-Down>", "wincmd j", "n") -- Navigate Down
-- mapkey("<S-Up>", "wincmd k", "n") -- Navigate Up
-- mapkey("<S-Right>", "wincmd l", "n") -- Navigate Right
--
-- -- Bind shift-arrows to navigation
-- mapkey("<F11>", "<C-w>h", "i") -- Navigate Left
-- mapkey("<F10>", "<C-w>j", "i") -- Navigate Down
-- mapkey("<F2>", "<C-w>k", "i") -- Navigate Up
-- mapkey("<F12>", "<C-w>l", "i") -- Navigate Right
-- mapkey("<F11>", "wincmd h", "t") -- Navigate Left
-- mapkey("<F10>", "wincmd j", "t") -- Navigate Down
-- mapkey("<F2>", "wincmd k", "t") -- Navigate Up
-- mapkey("<F12>", "wincmd l", "t") -- Navigate Right
-- mapkey("<F11>", "TmuxNavigateLeft", "n") -- Navigate Left
-- mapkey("<F10>", "TmuxNavigateDown", "n") -- Navigate Down
-- mapkey("<F2>", "TmuxNavigateUp", "n") -- Navigate Up
-- mapkey("<F12>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>|", "vsplit", "n", { desc = "Split window vertically" })
mapkey("<leader>sv", "vsplit", "n", { desc = "Split window vertically" })
mapkey("<leader>-", "split", "n", { desc = "Split window horizontally" })
mapkey("<leader>sh", "split", "n", { desc = "Split window horizontally" })
mapkey("<leader><Up>", "resize +2", "n")
mapkey("<leader><Down>", "resize -2", "n")
mapkey("<leader><Left>", "vertical resize +2", "n")
mapkey("<leader><Right>", "vertical resize -2", "n")
mapkey("<leader>se", "<C-w>=", "n", { desc = "Make splits equal size" })
mapkey("<leader>sx", "close<CR>", "n", { desc = "Close current split" })
mapkey("<leader>sc", "close<CR>", "n", { desc = "Close current split" })

-- tab management
mapkey("<leader>to", "tabnew<CR>", "n", { desc = "Open new tab" })
mapkey("<leader>tx", "tabclose<CR>", "n", { desc = "Close current tab" })
mapkey("<leader>tn", "tabn<CR>", "n", { desc = "Go to next tab" })
mapkey("<leader>tp", "tabp<CR>", "n", { desc = "Go to previous tab" })
mapkey("<leader>tf", "tabnew %<CR>", "n", { desc = "Open current buffer in new tab" })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

local api = vim.api

-- Commenting
api.nvim_set_keymap("n", "<C-c>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-c>", "goc", { noremap = false })
