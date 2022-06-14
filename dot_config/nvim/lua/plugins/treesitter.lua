return {
  init = function(use)

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = {
            'bash', 'json', 'jsonc', 'lua', 'nix', 'python', 'php', 'regex', 'rust', 'toml', 'tsx',
            'typescript', 'vim', 'vue', 'yaml',
          }
        }
      end
    }

  end,
}
