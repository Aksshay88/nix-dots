-- Example configuration for vim-dadbod
-- Enable filtering in vim-dadbod
vim.g.dadbod_enable_filtering = 1
vim.g.dadbod_enable_table_mode = 1
vim.g.dadbod_ui_use_popup = 1
-- vim-dadbod UI options
vim.g.dadbod_ui_win_position = 'right'
vim.g.dadbod_ui_win_height = 15
-- Key mappings for vim-dadbod functionality
vim.api.nvim_set_keymap('n', '<leader>db', ':DBUI<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DBConsole<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dt', ':DBTest<CR>', { noremap = true, silent = true })

