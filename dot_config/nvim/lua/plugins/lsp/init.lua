return {
  init = function(use)

    use {
      'neovim/nvim-lspconfig',
      requires = {
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
      },
      config = function()
        local lsp = require 'lspconfig'
        local keymap = vim.keymap
        local keymap_opts = { noremap = true, silent = true }

        keymap.set('n', '<leader>li', vim.lsp.buf.formatting_sync, keymap_opts)

        local servers = { 'sumneko_lua', 'bashls', 'rust_analyzer', 'ansiblels', 'pyright' }
        for _, server in ipairs(servers) do
          lsp[server].setup {
            capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
