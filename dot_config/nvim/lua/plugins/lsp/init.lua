return {
  init = function(use)

    use {
      'neovim/nvim-lspconfig',
      config = function()
        local lsp = require'lspconfig'

        local servers = {'sumneko_lua', 'bashls', 'rust_analyzer', 'ansiblels', 'pyright'}
        for _, server in ipairs(servers) do
          lsp[server].setup{
            capabilities = require'plugins.cmp'.capabilities,
          }
        end

        -- TODO: move to dedicated file
        lsp.ansiblels.setup {
          settings = {
            ansible = {
              ansible = {
                useFullyQualifiedCollectionNames = true,
              },
            },
          },
        }

        require('plugins/lsp/lua')

        -- TODO: 1. explore vim.lsp and configure keymaps for vim.lsp.buf
        --       https://github.com/neovim/nvim-lspconfig#suggested-configuration
        --       2. signature help (interactive) ???
        --       3. formatting
      end,
    }

  end,
}
