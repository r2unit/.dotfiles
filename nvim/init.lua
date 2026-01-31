vim.loader.enable()

require("config.options")
require("config.plugins")
require("config.keymaps")

require("ide").setup({
  auto_insert_mode = true,
  show_welcome = true,
  auto_open_explorer = false,
  default_layout = "ide",
})
