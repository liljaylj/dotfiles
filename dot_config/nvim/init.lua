-- shortcuts
local fn = vim.fn
local api = vim.api
local g = vim.g
local cmd = vim.cmd
local keymap = api.nvim_set_keymap

-- Base config
g.mapleader = ' '

-- Plugins
require'plugins'.init()

-- Old vim config
cmd 'source ~/.config/nvim/old.vim'
