-- Skip to first non-header line in email responses
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mail",
  callback = function()
    vim.schedule(function()
      local buf = vim.api.nvim_get_current_buf()
      local win = vim.api.nvim_get_current_win()
      local line_count = vim.api.nvim_buf_line_count(buf)

      -- Bail out early if the buffer is empty
      if line_count == 0 then
        return
      end

      -- Find the first empty line
      for i = 1, line_count do
        local line = vim.api.nvim_buf_get_lines(buf, i - 1, i, false)[1]
        if line == "" then
          local target = i + 1

          -- Guard: never move beyond the last line
          if target > line_count then
            target = line_count
          end

          vim.api.nvim_win_set_cursor(win, { target, 0 })
          return
        end
      end
    end)
  end,
})
