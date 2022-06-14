return {
  init = function(use)
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require'nvim-tree'.setup()
      end
    }

    local keymap_opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('', '<leader>fe', '<cmd>NvimTreeFocus<cr>', keymap_opts)
  end,
}
