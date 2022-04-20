local autocmd = vim.api.nvim_create_augroup

return {
  init = function(use)

    use {
      'mfussenegger/nvim-lint',
      config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
          sh = {'shellcheck'},
        }

        autocmd({'BufEnter', 'TextChanged', 'InsertLeave'}, {
          pattern = '<buffer>',
          callback = function()
            lint.try_lint()
          end,
        })
      end,
    }

  end,
}
