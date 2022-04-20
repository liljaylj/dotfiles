
return {
  init = function(use)
    local keymap = vim.api.nvim_set_keymap

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons'} }
    }

    local opts = {noremap = true, silent = true}
    -- files
    keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
    keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").git_files()<cr>', opts)
    keymap('n', '<leader>fr', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)

    -- lsp
    keymap('n', '<leader>f.', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts)

    -- neovim
    keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
    -- TODO: https://github.com/nvim-telescope/telescope.nvim#pickers

  end,
}
