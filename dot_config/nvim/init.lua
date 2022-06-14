-- shortcuts
local g = vim.g

-- Disable providers except python3
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

require'defaults'

-- Keymaps
require'keymaps'

-- Plugins
require'plugins'

-- TODO: create autocmd to automatically source init.lua when any of configuration files is edited (BufWrite?)

-- Old vim config
-- cmd 'source ~/.config/nvim/old.vim'
