local keymap = vim.api.nvim_set_keymap

return {
  init = function(use)

    use {
      -- 'phaazon/hop.nvim',
      'liljaylj/hop.nvim',
      config = function()
        require'hop'.setup {
          char2_fallback_key = '<cr>',
        }
      end,
    }

    keymap('', '<leader><leader>w', '<cmd>HopWord<cr>', {})
    keymap('', '<leader><leader>e', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.END})<cr>', {})
    keymap('o', '<leader><leader>e', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.END, inclusive_jump = true})<cr>', {})
    keymap('', '<leader><leader>r', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.MIDDLE})<cr>', {})
    keymap('o', '<leader><leader>r', '<cmd>lua require"hop".hint_words({hint_position = require"hop.hint".HintPosition.MIDDLE, inclusive_jump = true})<cr>', {})
    keymap('', '<leader><leader>t', '<cmd>HopChar1<cr>', {})
    keymap('', '<leader><leader>f', '<cmd>HopChar1<cr>', {})
    keymap('o', '<leader><leader>f', '<cmd>lua require"hop".hint_char1({inclusive_jump = true})<cr>', {})
    keymap('', '<leader><leader>s', '<cmd>HopChar2<cr>', {})
    keymap('', '<leader><leader>j', '<cmd>HopLineStartAC<cr>', {})
    keymap('', '<leader><leader>k', '<cmd>HopLineStartBC<cr>', {})
    keymap('', '<leader><leader>/', '<cmd>HopPattern<cr>', {})
    keymap('', '<leader><leader>?', '<cmd>lua require"hop".hint_patterns({hint_position = require"hop.hint".HintPosition.END})<cr>', {})
    keymap('o', '<leader><leader>?', '<cmd>lua require"hop".hint_patterns({hint_position = require"hop.hint".HintPosition.END, inclusive_jump = true})<cr>', {})

  end,
}
