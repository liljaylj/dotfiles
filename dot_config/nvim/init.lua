-- shortcuts
local cmd = vim.cmd  -- execute VimScript
local g = vim.g      -- g: global variables

-- Base config
g.mapleader = ' '

-- Plugins
require'plugins'.init()

-- TODO: create autocmd to automatically source init.lua when any of configuration files is edited (BufWrite?)

-- Old vim config
cmd 'source ~/.config/nvim/old.vim'
