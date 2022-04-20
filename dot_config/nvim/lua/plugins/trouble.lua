return {
  init = function(use)
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require'trouble'.setup{}
      end,
    }
  end
}
