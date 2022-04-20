return {
  init = function(use)

    use {
      'neovim/nvim-lspconfig',
      config = function()
        local lsp = require'lspconfig'

        local servers = {'sumneko_lua', 'bashls', 'rust_analyzer'}
        for _, server in ipairs(servers) do
          lsp[server].setup{
            capabilities = require'plugins.cmp'.capabilities,
          }
        end

        require('plugins/lsp/lua')
      end,
    }

  end,
}
