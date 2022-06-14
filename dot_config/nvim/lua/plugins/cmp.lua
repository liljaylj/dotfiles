return {
  init = function(use)

    use 'L3MON4D3/LuaSnip'
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        {'L3MON4D3/LuaSnip'},
      },
      config = function()
        local cmp = require'cmp'
        cmp.setup{
          sources = cmp.config.sources{
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
            {name = 'luasnip'},
          },
          snippet = {
            expand = function(args)
              require'luasnip'.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete({}),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
        }
      end,
    }
    use {
      'saadparwaiz1/cmp_luasnip',
      requires = {
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
      },
    }

  end,
}
