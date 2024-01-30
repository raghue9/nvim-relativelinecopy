local M = {}

M.copyPasteRelativeLinePositive = function(relative_line_number)
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local current_row = current_pos[1] - 1   -- Convert to 0-based indexing
  local target_row = current_row + relative_line_number

  if target_row >= 0 and target_row < vim.api.nvim_buf_line_count(0) then
    local line_content = vim.api.nvim_buf_get_lines(0, target_row, target_row + 1, false)[1]
    vim.api.nvim_buf_set_lines(0, current_row, current_row, false, { line_content })
  end
end

M.copyPasteRelativeLineNegative = function(relative_line_number)
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local current_row = current_pos[1] - 1
  local target_row = current_row - math.abs(relative_line_number)

  if target_row >= 0 and target_row < vim.api.nvim_buf_line_count(0) then
    local line_content = vim.api.nvim_buf_get_lines(0, target_row, target_row + 1, false)[1]
    vim.api.nvim_buf_set_lines(0, current_row, current_row, false, { line_content })
  end
end

return M
