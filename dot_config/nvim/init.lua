-- shortcuts
local cmd = vim.cmd  -- execute VimScript
local g = vim.g      -- g: global variables
local o = vim.o      -- options
local keymap = vim.api.nvim_set_keymap

-- Disable providers except python3
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- Base config
g.mapleader = ' '

o.number = true
o.relativenumber = true

-- Plugins
require'plugins'.init()

-- TODO: create autocmd to automatically source init.lua when any of configuration files is edited (BufWrite?)

-- Old vim config
cmd 'source ~/.config/nvim/old.vim'

-- Keybindings
local keymap_opts = {noremap = true, silent = true}

keymap('', '<leader>rr', '<cmd>set rnu!', keymap_opts) -- relative/absolute line numbering toggle
