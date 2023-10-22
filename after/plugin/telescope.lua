local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- vim.keymap.set('n', '<leader>pf', builtin.grep_string, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
   builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

telescope.setup({
    file_ignore_patterns = { "node%_modules/.*" }
})
