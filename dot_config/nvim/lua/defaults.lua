local opt = vim.opt
local cmd = vim.cmd

-- Leader key
vim.g.mapleader = ' '

-- Options
opt.compatible = false
opt.backspace = 'indent,eol,start'
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 0
opt.autoread = true
opt.mouse = 'a'
opt.timeoutlen = 3000
opt.ruler = true
opt.laststatus = 2
opt.wildmenu = true
opt.scrolloff = 3
opt.sidescrolloff = 5
opt.display:append'lastline'
opt.encoding = 'utf-8'
opt.formatoptions:append'j'
opt.history = 10000
opt.tabpagemax = 50
opt.hlsearch = true
opt.incsearch = true
opt.wrap = false
opt.foldmethod = 'marker'
opt.background = 'dark'
opt.number = true
opt.relativenumber = true

cmd'syntax enable'
cmd'filetype plugin indent on'
