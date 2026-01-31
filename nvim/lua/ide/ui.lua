local M = {}

function M.setup()
  vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ",
    diff = "╱",
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
  }

  vim.opt.listchars = {
    tab = "→ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
  }

  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.api.nvim_create_user_command("IDE", function()
    require("ide.layout").toggle_ide_layout()
  end, {})

  vim.api.nvim_create_user_command("IDELayout", function()
    require("ide.layout").open_ide_layout()
  end, {})
end

function M.show_startup_message()
  vim.notify("Welcome to Neovim IDE! Press Space for commands, Ctrl+B for files", vim.log.levels.INFO)
end

return M
