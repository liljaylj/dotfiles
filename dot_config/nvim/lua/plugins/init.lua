local fn = vim.fn

local packer_dir = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

return {
  init = function(use)
    -- Bootstrap Packer
    if fn.empty(fn.glob(packer_dir)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_repo, packer_dir})
    end

    -- Start Packer
    require'packer'.startup(function(use)

      use 'wbthomason/packer.nvim'
      for _, module in pairs({
        require('plugins.hop'),
        require('plugins.lightspeed'),
        require('plugins.editorconfig'),
      })
      do
        module.init(use)
      end

      if packer_bootstrap then
        require'packer'.sync()
      end
    end)
  end,
}
