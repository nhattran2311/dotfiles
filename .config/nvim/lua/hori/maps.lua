vim.g.mapleader = ","
local keymap = vim.keymap

keymap.set('i', 'jj', '<Esc>')
keymap.set('v', '<Tab>', '>gv')
keymap.set('v', '<S-Tab>', '<gv')

keymap.set('n', 'x', '"_x')
keymap.set('n', '<leader>d', '"_d')


-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Copy and paste with system clipboard

vim.keymap.set("v", "<C-c>", '"+y', { silent = true })
vim.keymap.set("i", "<C-v>", "<C-r>+", { silent = true })

-- Save and quit

vim.keymap.set("n", "<C-s>", ":write<cr>", { silent = true })
vim.keymap.set("n", "<C-q>", ":quit<cr>", { silent = true })
-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})


-- New tab
keymap.set('n', 'te', ':tabedit<cr>')
keymap.set('n', 'J', ':tabprev<cr>')
keymap.set('n', 'K', ':tabnext<cr>')
keymap.set('n', '<leader>1', '1gt')
keymap.set('n', '<leader>2', '2gt')
keymap.set('n', '<leader>3', '3gt')
keymap.set('n', '<leader>4', '4gt')
keymap.set('n', '<leader>5', '5gt')
keymap.set('n', '<leader>6', '6gt')
keymap.set('n', '<leader>7', '7gt')
keymap.set('n', '<leader>8', '8gt')
keymap.set('n', '<leader>9', '9gt')
keymap.set('n', '<leader>0', ':tablast<cr>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'sc', '<C-w>q') -- close split windows

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Terminal windows  :PackerLoad toggleterm.lua<cr>:ToggleTerm<cr>
keymap.set('n', "<C-m>", ":echo 'wrong key'<CR>")
-- keymap.set('t', '<Esc>', '<C-\><C-n>')
-- keymap.set('t', ':q!', '<C-\><C-n>:q!<CR>')

-- Nvim Tree
keymap.set("n", "<leader>d", ":PackerLoad nvim-tree.lua<cr>:NvimTreeToggle<CR>", { silent = true })

keymap.set("n", "<S-q>", ":PackerLoad nvim-tree.lua<cr>:NvimTreeFocus<CR>", { silent = true })

