local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic file operations (IDE-style)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-w>", ":bd<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)
map("n", "<C-S-q>", ":qa<CR>", opts)
map("n", "<C-n>", ":enew<CR>", opts)

-- Spotlight/Quick Open (Cmd+P style)
map("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Quick Open File" })
map("n", "<C-o>", ":Telescope find_files<CR>", opts)
map("n", "<C-S-o>", ":Telescope file_browser<CR>", opts)

-- Command Palette (Cmd+Shift+P style)
map("n", "<C-S-p>", ":Telescope commands<CR>", { desc = "Command Palette" })
map("n", "<leader><leader>", ":Telescope commands<CR>", { desc = "Command Palette" })

-- Search everywhere
map("n", "<C-f>", ":Telescope live_grep<CR>", { desc = "Search in Files" })
map("n", "<C-S-f>", ":Telescope grep_string<CR>", { desc = "Search Current Word" })
map("n", "<C-h>", ":%s/", { noremap = true, desc = "Find and Replace" })

-- Go to anything
map("n", "<leader>.", ":Telescope resume<CR>", { desc = "Resume Last Search" })
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in Buffer" })
map("n", "<leader>:", ":Telescope command_history<CR>", { desc = "Command History" })

-- Buffer navigation
map("n", "<C-Tab>", ":bnext<CR>", opts)
map("n", "<C-S-Tab>", ":bprev<CR>", opts)
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opts)

-- Comments
map("n", "<C-/>", "gcc", { remap = true })
map("v", "<C-/>", "gc", { remap = true })

-- Undo/Redo
map("n", "<C-z>", "u", opts)
map("n", "<C-S-z>", "<C-r>", opts)
map("i", "<C-z>", "<Esc>ui", opts)

-- Clipboard
map("v", "<C-c>", '"+y', opts)
map("v", "<C-x>", '"+d', opts)
map("n", "<C-v>", '"+p', opts)
map("i", "<C-v>", '<C-r>+', opts)
map("v", "<C-v>", '"+p', opts)
map("n", "<C-a>", "ggVG", opts)

-- File explorer
map("n", "<C-b>", ":Neotree toggle<CR>", opts)
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Terminal
map("n", "<C-\\>", ":ToggleTerm<CR>", opts)
map("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- LSP keybindings
map("n", "<F2>", vim.lsp.buf.rename, opts)
map("n", "<F3>", ":Telescope lsp_references<CR>", opts)
map("n", "<F4>", vim.lsp.buf.code_action, opts)
map("n", "<F12>", vim.lsp.buf.definition, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gr", ":Telescope lsp_references<CR>", opts)

-- Debugging
map("n", "<F5>", ":DapContinue<CR>", opts)
map("n", "<F9>", ":DapToggleBreakpoint<CR>", opts)
map("n", "<F10>", ":DapStepOver<CR>", opts)
map("n", "<F11>", ":DapStepInto<CR>", opts)
map("n", "<S-F11>", ":DapStepOut<CR>", opts)

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Autocomplete trigger
map("i", "<C-Space>", function() require('cmp').complete() end, opts)

-- Find group (leader+f)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find in Files (Grep)" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find Help" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent Files" })
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { desc = "Find Symbols" })
map("n", "<leader>fS", ":Telescope lsp_workspace_symbols<CR>", { desc = "Find Workspace Symbols" })
map("n", "<leader>fd", ":Telescope diagnostics<CR>", { desc = "Find Diagnostics" })
map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find Keymaps" })
map("n", "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Find Colorscheme" })

-- Go language
map("n", "<leader>gt", ":GoTest<CR>", opts)
map("n", "<leader>gr", ":GoRun<CR>", opts)
map("n", "<leader>gc", ":GoCoverageToggle<CR>", opts)
map("n", "<leader>gi", ":GoImpl<CR>", opts)
map("n", "<leader>gf", ":GoFillStruct<CR>", opts)

-- Rust language
map("n", "<leader>rt", ":RustTest<CR>", opts)
map("n", "<leader>rr", ":RustRun<CR>", opts)
map("n", "<leader>re", ":RustExpand<CR>", opts)

-- Code actions
map("n", "<leader>fm", function() require("conform").format() end, { desc = "Format File" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Better escape
map("i", "jk", "<Esc>", opts)
map("i", "jj", "<Esc>", opts)

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Quick save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>x", ":x<CR>", { desc = "Save and Quit" })
