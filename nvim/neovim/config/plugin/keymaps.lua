local telescopebuiltin = require("telescope.builtin")
-- there might be a conflict with the cmp keymaps
vim.keymap.set('n', '<C-p>', telescopebuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopebuiltin.live_grep, {})

-- neotree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})

-- vim native
-- window commands
vim.keymap.set('n', '<C-A-J>', ':wincmd J<CR>', {})
vim.keymap.set('n', '<C-A-K>', ':wincmd K<CR>', {})
vim.keymap.set('n', '<C-A-H>', ':wincmd H<CR>', {})
vim.keymap.set('n', '<C-A-L>', ':wincmd L<CR>', {})
