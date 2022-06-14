local keymap = vim.api.nvim_set_keymap

return {
  init = function(use)

    use {
      'phaazon/hop.nvim',
      config = function()
        require'hop'.setup {
          char2_fallback_key = '<cr>',
        }
      end,
    }

    local opts = {noremap = true, silent = true}
    keymap('', '<leader><leader>w', '<cmd>HopWord<cr>', opts)
    keymap('', '<leader><leader>e', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.END})<cr>', opts)
    keymap('o', '<leader><leader>e', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.END, inclusive_jump = true})<cr>', opts)
    keymap('', '<leader><leader>r', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.MIDDLE})<cr>', opts)
    keymap('o', '<leader><leader>r', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.MIDDLE, inclusive_jump = true})<cr>', opts)
    keymap('', '<leader><leader>t', '<cmd>HopChar1<cr>', opts)
    keymap('', '<leader><leader>f', '<cmd>HopChar1<cr>', opts)
    keymap('o', '<leader><leader>f', '<cmd>lua require"hop".hint_char1({inclusive_jump = true})<cr>', opts)
    keymap('', '<leader><leader>s', '<cmd>HopChar2<cr>', opts)
    keymap('', '<leader><leader>j', '<cmd>HopLineStartAC<cr>', opts)
    keymap('', '<leader><leader>k', '<cmd>HopLineStartBC<cr>', opts)
    keymap('', '<leader><leader>/', '<cmd>HopPattern<cr>', opts)
    keymap('', '<leader><leader>?', '<cmd>lua require"hop".hint_patterns({hint_position = require"hop.hint".HintPosition.END})<cr>', opts)
    keymap('o', '<leader><leader>?', '<cmd>lua require"hop".hint_patterns({hint_position = require"hop.hint".HintPosition.END, inclusive_jump = true})<cr>', opts)

  end,
}
