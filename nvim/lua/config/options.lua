local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.expandtab = false

-- Search
opt.incsearch = true
opt.ignorecase = false
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.relativenumber = false
opt.number = false
opt.termguicolors = true
opt.guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- opt.colorcolumn = "80"
opt.signcolumn = "auto"
opt.cmdheight = 1
opt.scrolloff = 15
opt.completeopt = "menuone,noinsert,noselect"

opt.list = false
--opt.listchars = { tab = "!-", trail = "·", nbsp = "␣" }
opt.listchars = { tab = "!-", nbsp = "␣" }

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse = ""
--opt.mouse:append("a")
opt.clipboard = ""
--opt.clipboard = "unnamed,unnamedplus"
--opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
opt.showmode = false

-- folds
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 99

-- Some color stuff
-- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#658594", bg = "NONE" })

-- Highlight what we yank briefly
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YangHighlight", { clear = true }),
    pattern = "*",
    callback = function()
	vim.highlight.on_yank()
    end,
    desc = "Highlight yank",
})
