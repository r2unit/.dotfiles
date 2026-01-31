local M = {}

function M.setup()
  local map = vim.keymap.set

  -- Settings/preferences
  map("n", "<C-,>", ":Telescope keymaps<CR>", { desc = "Show All Keybindings" })

  -- Explorer toggle (works in all modes)
  map({ "n", "i", "v" }, "<C-S-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })

  -- Git integration
  map("n", "<leader>gg", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = 150,
        height = 40,
      },
    })
    lazygit:toggle()
  end, { desc = "Open LazyGit" })

  map("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff" })
  map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame Line" })

  -- IDE Layout
  map("n", "<leader>l", "<cmd>IDELayout<cr>", { desc = "Open IDE Layout" })

  -- Spotlight-style search (everything search)
  map("n", "<leader>ss", function()
    require("telescope.builtin").builtin({ include_extensions = true })
  end, { desc = "Search All Telescope Pickers" })

  -- Quick symbol outline
  map("n", "<leader>o", ":Telescope lsp_document_symbols<CR>", { desc = "Symbol Outline" })

  -- Project-wide search and replace
  map("n", "<leader>sr", function()
    local search = vim.fn.input("Search: ")
    if search ~= "" then
      vim.cmd("Telescope live_grep default_text=" .. search)
    end
  end, { desc = "Search and Replace" })
end

return M
