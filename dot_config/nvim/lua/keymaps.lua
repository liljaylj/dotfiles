local keymap = vim.keymap
local keymap_opts = { noremap = true, silent = false }

-- relative/absolute line numbering toggle
keymap.set('', '<leader>rr', '<cmd>set rnu!<cr>', keymap_opts)

-- Move in insert/command mode
keymap.set({ 'i', 'c' }, '<C-h>', '<Left>', keymap_opts)
keymap.set({ 'i', 'c' }, '<C-j>', '<Down>', keymap_opts)
keymap.set({ 'i', 'c' }, '<C-k>', '<Up>', keymap_opts)
keymap.set({ 'i', 'c' }, '<C-l>', '<Right>', keymap_opts)

-- toggle word wrap
keymap.set('n', '<leader>p', '<cmd>set wrap!<cr>', keymap_opts)

-- toggle 24-bit color support
keymap.set('n', '<leader>t', '<cmd>set tgc!<cr>', keymap_opts)
