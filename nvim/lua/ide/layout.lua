local M = {}

M.ide_layout_active = false

function M.setup()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        vim.defer_fn(function()
          require("ide.welcome").show()
          M.open_ide_layout()
        end, 10)
      end
    end,
  })
end

function M.open_ide_layout()
  vim.cmd("Neotree show left")
  
  vim.cmd("wincmd l")
  
  if vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) == "" then
    vim.cmd("enew")
  end
  
  M.ide_layout_active = true
  
  vim.notify("IDE Layout Active - Ctrl+B to toggle explorer", vim.log.levels.INFO)
end

function M.toggle_ide_layout()
  if M.ide_layout_active then
    vim.cmd("Neotree close")
    M.ide_layout_active = false
  else
    M.open_ide_layout()
  end
end

function M.open_terminal_split()
  vim.cmd("belowright split")
  vim.cmd("terminal")
  vim.cmd("resize 15")
  vim.cmd("startinsert")
end

return M
