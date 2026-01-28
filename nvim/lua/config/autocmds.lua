-- Skip to first non-header line in email responses
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mail",
  callback = function()
    vim.schedule(function()
      -- Search for the first empty line and move one line below it
      local line_count = vim.api.nvim_buf_line_count(0)
      for i = 1, line_count do
        local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
        if line == "" then
          vim.api.nvim_win_set_cursor(0, {i + 1, 0})
          break
        end
      end
    end)
  end,
})
