local fn = vim.fn

local packer_dir = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

-- TODO: create autocmd to automatically source and PackerCompile when any of plugin conf files is edited (BufWrite?)

return {
  init = function()
    -- Enable built-in plugins
    vim.cmd 'packadd matchit'

    -- Bootstrap Packer
    local packer_bootstrap = false
    if fn.empty(fn.glob(packer_dir)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', packer_repo, packer_dir })
      packer_bootstrap = vim.v.shell_error ~= 0
    end

    -- Start Packer
    require 'packer'.startup(function(use)

      use 'wbthomason/packer.nvim'

      use 'nvim-lua/plenary.nvim'

      for _, module in pairs({
        -- neovim
        require('plugins.hop'),
        require('plugins.lightspeed'),
        require('plugins.indent-blankline'),
        require('plugins.treesitter'),
        require('plugins.lsp'),
        require('plugins.cmp'),
        require('plugins.lint'),
        require('plugins.telescope'),
        require('plugins.gitsigns'),
        require('plugins.trouble'),
        require('plugins.cheatsheet'),
        require('plugins.comment'),
        require('plugins.todo-comments'),
        -- vim
        require('plugins.wordmotion'),
        require('plugins.highlightedyank'),
        require('plugins.codestats'),
      }) do
        module.init(use)
      end

      for _, plugin in pairs({
        -- neovim
        'gpanders/editorconfig.nvim',
        'mfussenegger/nvim-dap',
        'folke/lsp-colors.nvim',
        -- vim
        'tpope/vim-repeat',
        'tpope/vim-surround',
        -- 'tpope/vim-commentary',
        'vim-scripts/ReplaceWithRegister',
        'wellle/targets.vim',
        'michaeljsmith/vim-indent-object',
        'thinca/vim-visualstar',
        'kyazdani42/nvim-web-devicons',
        'tridactyl/vim-tridactyl',
      }) do
        use(plugin)
      end

      if packer_bootstrap then
        require 'packer'.sync()
      end
    end)
  end,
}
