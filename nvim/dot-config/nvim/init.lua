
-- Set tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set relative numbers
vim.opt.relativenumber = true

-- Disable background color
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', ctermbg = 'NONE' })
