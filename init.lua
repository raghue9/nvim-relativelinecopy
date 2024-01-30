-- nvim-relativelinecopy/init.lua
local relcopy = require('relativelinecopy')

vim.api.nvim_set_keymap('n', '<leader>cp',
  [[<Cmd>lua require('relativelinecopy').copyPasteRelativeLine(vim.v.count1)<CR>]], { noremap = true, silent = true })
