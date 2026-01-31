-- General options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Tabs and indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Display
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Behavior
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.showmode = false
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"

-- Appearance
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = ".", nbsp = "%" }

-- Performance
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

-- Clear search highlight on pressing Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
