-- nvim-relativelinecopy/relativelinecopy.lua
local M = {}

M.copyPasteRelativeLine = function(relative_line_number)
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local current_row, _ = table.unpack(current_pos)
  local target_row = current_row + relative_line_number

  local line_content = vim.api.nvim_buf_get_lines(0, target_row - 1, target_row, false)[1]

  if line_content then
    vim.api.nvim_buf_set_lines(0, current_row, current_row, false, { line_content })
  end
end

return M
