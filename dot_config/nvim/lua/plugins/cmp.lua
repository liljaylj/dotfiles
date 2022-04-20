return {
  init = function(use)

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
      },
      config = function()
        local cmp = require'cmp'
        cmp.setup{
          sources = cmp.config.sources{
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
          },
        }
      end,
    }

  end,

  capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
