local M = {}

function M.setup()
  local ide = require("ide")
  
  vim.api.nvim_create_autocmd("BufRead", {
    callback = function()
      if vim.bo.buftype == "" and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
        if ide.config.auto_insert_mode then
          vim.cmd("startinsert")
        end
      end
    end,
  })
  
  vim.api.nvim_create_autocmd("BufNewFile", {
    callback = function()
      if ide.config.auto_insert_mode then
        vim.defer_fn(function()
          vim.cmd("startinsert")
        end, 10)
      end
    end,
  })
  
  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.signcolumn = "no"
      vim.cmd("startinsert")
    end,
  })
  
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
  
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end,
  })
  
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
  })
  
  local format_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    callback = function()
      require("conform").format({ async = false, lsp_fallback = true })
    end,
  })
end

return M
