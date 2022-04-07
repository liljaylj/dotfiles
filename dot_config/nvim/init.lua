-- shortcuts
local cmd = vim.cmd  -- execute VimScript
local g = vim.g      -- g: global variables

-- Base config
g.mapleader = ' '

-- Plugins
require'plugins'.init()

-- Old vim config
cmd 'source ~/.config/nvim/old.vim'
