local fn = vim.fn
local cmd = vim.cmd

local packer_dir = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

return {
  init = function(use)
    -- Enable built-in plugins
    cmd 'packadd matchit'

    -- Bootstrap Packer
    if fn.empty(fn.glob(packer_dir)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_repo, packer_dir})
    end

    -- Start Packer
    require'packer'.startup(function(use)

      use 'wbthomason/packer.nvim'

      for _, module in pairs({
        -- neovim
        require('plugins.hop'),
        require('plugins.lightspeed'),
        require('plugins.indent-blankline'),
        require('plugins.treesitter'),
        -- vim
        require('plugins.wordmotion'),
        require('plugins.highlightedyank'),
        require('plugins.codestats'),
      })
      do
        module.init(use)
      end

      for _, plugin in pairs({
        -- neovim
        'gpanders/editorconfig.nvim',
        -- vim
        'tpope/vim-repeat',
        'tpope/vim-surround',
        'tpope/vim-commentary',
        'vim-scripts/ReplaceWithRegister',
        'wellle/targets.vim',
        'michaeljsmith/vim-indent-object',
        'thinca/vim-visualstar',
      })
      do
        use (plugin)
      end

      if packer_bootstrap then
        require'packer'.sync()
      end
    end)
  end,
}
