local M = {}

M.config = {
  auto_insert_mode = true,
  show_welcome = true,
  auto_open_explorer = false,
  default_layout = "ide",
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  
  require("ide.ui").setup()
  require("ide.keymaps").setup()
  require("ide.layout").setup()
  require("ide.autocmds").setup()
end

return M
